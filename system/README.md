# System Configuration

This directory contains system-level configurations that cannot be managed via GNU Stow (they require root access).

## Contents

### PAM Configuration (`pam.d/`)

Configures gnome-keyring integration for:
- **Auto-unlock on login**: Keyring unlocks automatically when you log in via TTY
- **Password sync**: Keyring password stays in sync when you change your user password

Requirements:
- `gnome-keyring` package installed
- User password must match keyring password

## Full Setup Checklist

### 1. Install PAM configuration (requires sudo)

```bash
sudo ./setup.sh
```

The script will:
- Backup existing PAM files (timestamped)
- Install the gnome-keyring PAM configuration

### 2. Enable SSH agent (as regular user)

```bash
systemctl --user enable gcr-ssh-agent.socket
```

### 3. Stow the ssh config

```bash
cd ~/dotfiles
stow ssh
```

This replaces any existing `~/.ssh/config` (backup first if needed).

### 4. Re-login

Log out and back in for PAM changes to take effect. The keyring will auto-unlock using your login password.

### 5. Add SSH keys to the agent

```bash
ssh-add ~/.ssh/id_ed25519
# or wherever your keys are
```

Keys will be stored in the keyring for future sessions.

## Verification

After setup, verify everything is working:

```bash
# Check SSH agent is running
ssh-add -l

# Check keyring daemon
systemctl --user status gnome-keyring-daemon

# Test Secret Service
secret-tool store --label='test' test key <<< "testvalue"
secret-tool lookup test key
secret-tool clear test key
```

## Reverting

### PAM files

Backup files are created with timestamps in `/etc/pam.d/`:

```bash
sudo cp /etc/pam.d/login.bak.TIMESTAMP /etc/pam.d/login
sudo cp /etc/pam.d/passwd.bak.TIMESTAMP /etc/pam.d/passwd
```

### SSH agent

```bash
systemctl --user disable gcr-ssh-agent.socket
```

## References

- [Arch Wiki: GNOME/Keyring](https://wiki.archlinux.org/title/GNOME/Keyring)

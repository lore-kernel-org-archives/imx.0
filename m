Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86622453A49
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521050; cv=none; b=V5R9h02kyvQY4IyMSDMn9lK7ar7WE+x0jX3/NIB8FclS7twUDUL7PDXtBy/4/40CS6tp4gRwfFJycYsS4+qklGjdUhd3n6gJIBpg86smPRi5/DIGICRWuvL2DlayDzG0bYX0uXHEDw5cT696j5ZCi2wCduOU+L/1h2K8hxxYweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521050; c=relaxed/simple;
	bh=YOKf9/usp4erLkDN0Msqj3Z2/dbnL0uqaOiOLKQ/ALI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z6ZmZFMow6NizNUGDm6eHa0qeW/DZXFIRcQt4+SO+P1eQ0RtwabB/GQnD9wHWUaWe34wJ/sLQ9JgZy2J7ikJkSWqbyKDVcwRx3MnpEwiqggR0s6LkZpxw1CxtieAkjJRO2NCNi5FjmnwtH5Hn2CQ7oifFL6eu/U0ultga3c8PjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4bth54V; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4bth54V"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so628084f8f.3
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521042; x=1786125842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=n4bth54Vak74i1Aguxak0wOs+zqQ9bo+aT/eYA54xiCS84zeAIKi11Ktou/xFI1gn3
         va3bTz8pGT/GUKdXPWbiVapcP9ARfgh22owGeakmDNnqi4exRKm6Z/jBzhVTNfLxPKEE
         pajD1VnQAXRDDTcjFjY1jfeeHGHfZrHg0XHw5XkG1xu22pa4K4By4qbIFPOggKO86SiZ
         oNAE8Yh3vYdVKO82KfVI0/SPmT5bQ8gVTsRlZiiCpUPkpLgMPSI0GwaU8L94M4Sn8i5E
         TDPzaHvS0oj+LvuKeVpXjOOSN09B5RLQaco6s1qPwUdfq7rLP+QRU1Ot4yi6NDl4j6qL
         Zmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521042; x=1786125842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=m+cXUAUvBsVBVrBvw36ZYAO2lptN0MiZtwkmVbRDADHS01qGUBYeuI2dKT+5XCb5+H
         O9eZYAWsl5FZ9eAv3pqkyJTG0iWInLGAfmO40pMsFftXragpB4pyJGVTE4/CzqotFkua
         HGBnzfVvNqnIcWlU94JMNJOH0HrrKIu7kHhk74VvZ0WacUyTMa0MsU/ohdWdzyo2CMsK
         Gczxb0y47Ut6/PfbMH7ZQXg4fQeBx5iT8nUj2tPYI00pwlvK7oz49IhF7Vuu3mFLdps3
         /Rw42oHEF5I57IPgj9T4Rbb+J1j7QKfqjLWqZ9k0zN/AiEwHvQNz4P+G04VadQjfg7OG
         MKLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaffeezYd4H7BxuFs574UZdARSJe/7I3dfm1KkOIHSYWKq0UsjDk4NfRswHVP57bsYp7E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv4aFTgmbOMFGjvwCC72iUbkj+qZfSDURoDZup/pUW8UG0KY7N
	sV0D4TZAhjuS/EV+tyaEn0qJufjwz09I293mzGZ1Qjfozwvw2Au4fX7WfP090xIq
X-Gm-Gg: AR+sD11rlq7BIyDwege+C1x3+qx8gyYpk9aHGe4yntiQN06Z97eVU5lJsVLdV8y65YX
	IHr2tGjpJ2appVh/Y/DYZmEKJ76sbtLPNUD4XdzH83TmeU5wu8+uJdaND0FCBMU237JwtFojAwi
	AF4MQa/WPjnBMSj1W3o/apGXz3QTjH9qjGrQxwYlPGqneGeq2aOQE77WMTGA8Rm0nZnT6cDlUN9
	1PcP+0txfdjtiFkRc/yKwBL8IHDGbO9LQcoj94GWsSqT3y1VLXvX5cpLbPAsnE4spS/Bp8epc+9
	jowC6/6mWr9l2nop/sdvvQiqIUq8ymzi37x+ZsyusFSXE8zHCulh/5s3Orsb9bo3MQbmJVp/5nW
	l3+n2Et0TCWHMGIrksAj2dSWdgQ6JHQFFCfzMNbpRBCKKSU8hZhgTsgpywxBIb8E5+5SjJjfR09
	eK7wSVsCho2yfeu5ebKgxSlBZqmEkrWSRbOquk3XhwRIgvYzJkfZRxhpajOsozqQGFCpAlmreop
	TV473f1xR9JeKnPLyJmmSPRLfBy4kp04azz2mxrXUvsG2gr5RBYPYlUqQz/+vgpK3uYDAIxImUC
	r3eK8l3puYNcjLPu/DqGeBjkV1+zp32uSrTWPVDpUzhEld6PB84VwH+WsMSM0I19tzij
X-Received: by 2002:a05:6000:1366:b0:47f:77a4:fd0 with SMTP id ffacd0b85a97d-47fd72a8e32mr1022136f8f.22.1785521041538;
        Fri, 31 Jul 2026 11:04:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1240sm7164084f8f.36.2026.07.31.11.04.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:04:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/5] serial: core: do fallible allocations before the console can be registered
Date: Fri, 31 Jul 2026 20:03:57 +0200
Message-Id: <20260731180357.10843-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

serial_core_add_one_port() allocates uport->tty_groups after
uart_configure_port(), which may register the console. If the allocation
fails, the driver unwinds the port while its console remains registered.
The earlier uport->name allocation has a related failure path that leaves
state->uart_port linked to a port being freed.

Failslab reproduced a NULL dereference in PL011 console output and a KASAN
use-after-free in i.MX console output after failed binds.

Allocate the name and tty_groups before linking the port and configuring
it. Reserve space for the optional driver attribute group because
config_port() may populate uport->attr_group during configuration.

Fixes: 266dcff03eed ("Serial: allow port drivers to have a default attribute group")
Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struct")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260719070454.D6FA21F000E9@smtp.kernel.org/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/serial_core.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..03ee3d038f4e 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3056,7 +3056,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
-	int num_groups;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3068,6 +3067,22 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	if (state->uart_port)
 		return -EINVAL;
 
+	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
+				drv->tty_driver->name_base + uport->line);
+	if (!uport->name)
+		return -ENOMEM;
+
+	/*
+	 * uart_configure_port() may set uport->attr_group and register the
+	 * console. Allocate room for both groups and a NULL terminator first.
+	 */
+	uport->tty_groups = kzalloc_objs(*uport->tty_groups, 3);
+	if (!uport->tty_groups) {
+		kfree(uport->name);
+		return -ENOMEM;
+	}
+	uport->tty_groups[0] = &tty_dev_attr_group;
+
 	/* Link the port to the driver state table and vice versa */
 	atomic_set(&state->refcount, 1);
 	init_waitqueue_head(&state->remove_wait);
@@ -3084,10 +3099,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	state->pm_state = UART_PM_STATE_UNDEFINED;
 	uart_port_set_cons(uport, drv->cons);
 	uport->minor = drv->tty_driver->minor_start + uport->line;
-	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
-				drv->tty_driver->name_base + uport->line);
-	if (!uport->name)
-		return -ENOMEM;
 
 	if (uport->cons && uport->dev)
 		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
@@ -3102,15 +3113,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 
 	port->console = uart_console(uport);
 
-	num_groups = 2;
-	if (uport->attr_group)
-		num_groups++;
-
-	uport->tty_groups = kzalloc_objs(*uport->tty_groups, num_groups);
-	if (!uport->tty_groups)
-		return -ENOMEM;
-
-	uport->tty_groups[0] = &tty_dev_attr_group;
 	if (uport->attr_group)
 		uport->tty_groups[1] = uport->attr_group;
 
-- 
2.53.0

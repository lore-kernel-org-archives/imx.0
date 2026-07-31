Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B42368D79
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521936; cv=none; b=t78BwYmAqm9MHuUyc0yOEsIjufsUDxm/gR7tnQcxlELEgq0DiqqBtdq/Pf4b5tnR8k+7MCYUGtAwDZJzKtkmeJxANQfj8YVWDwW2ciZFJELerCn1GFAt2xY3o2mufjpcg9hIAXpW8fW0OSWeHsVLiMBI/0L7Z7lvSHIgoiVM00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521936; c=relaxed/simple;
	bh=YOKf9/usp4erLkDN0Msqj3Z2/dbnL0uqaOiOLKQ/ALI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BDPp4lfj8YNk0KyS277JBsvRry784Sb6V1cXTPwjy9IljDXOWFM/YdK60ZyhswWsu2iorvY8/Diqtr8Y37jLUzSpZsVdQp4e0lMKIwnzNJcYyta5StFmzK99nasT7KAG25mp9COGiRN6RZV6RDp2z12KO3dW5RWNTUQXVy/EW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=log63d59; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="log63d59"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1381728f8f.0
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521932; x=1786126732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=log63d59yrKwhkOrWJu8lNTyexlbhzLZWhIhJ8xo+TXKiuMWoG6XWIr21aAUjhD0GC
         VwplOxdWFoQuQP8C6LKi/fKRSYfgoIZsVxUv2mHjhD4fKR0Au7gcQAQwMAeK8nRt+MYo
         lUNjMwzrtEgySmZ/nFdl/h/FbNbqRMKobRmxkpDVqOoN7UfSy3zMTTLCyChJ8PjttTnd
         bQ3cf4wHzEd/jonePGKYTf11Cln+JEuPI6ZBFnkYOiNgSAvJq4OnvPEh3Z5xje99AGqm
         EgddlT1ajN47uUgRIljcpKD5f82zXRy26Q6Dvqwh7RNDvUrJN+thqRl5Qctmq7CaUMBG
         4uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521932; x=1786126732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=X+IJDgR9AtYHhdhhCk6ltYxlR7JBHbhm5SmO5VJVQm63IYLU1ev89OYoNXgcHbcIIN
         ahbqJG0QiDL5gSyUzEdOynZiRs0q1aAZY53IXKI19nSd35AM0K4r360hrCvREokt/Lrp
         lSTLVcxPFHiM8PVV81roiObYiiJ6l120B665ZbCmpexCU79pGwl8zvpd+LBBy5nhMScn
         l/E+6RrW8xt5zKH8Z7Ev66N7vSGTiRJTUfx6u80OWIU5xzUh2lshb1d0A9X2t1DTfTio
         BreTxVGedsvb3UddYYdMWN2g2nq/NXQYVxdvZ68daYJjmmbXXcl5LG4ydg0acR5FpaEF
         AM2w==
X-Forwarded-Encrypted: i=1; AHgh+RpSIwNldoeJTeSR3g59Pqn1EVDghXJFP9N8ZBgfGGZhtHgQwSNjKOVLAKMJbw8XsW7/V54=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh5NU+dZJu2Jkw/uBn9I+Rnm8iCISDZa8zDuCXvUPE6Ec+Oc2D
	3KTIknq5c/fTOoZCPB3gNijXO4duGrYyCNJL9d+jQE/xj6ofP4dR9Cmn
X-Gm-Gg: AR+sD12cCmX0lgFq8mUKoXN7SikgrR4G3QS62LzKAIjjAr058yepIsomexevqKFsXdU
	7pOnp26MjnA+5dHSzkSdpRNch/H2fFmiCy/uJbeNFoBj/Msem+/Q52xcyEG3jvFwhG7Z7qJhMZg
	yZp+XmXjhYQ9tmFWwqGqo8JY+a5JjHx5ZrZqxQjk8UZKkEKGrGoG7ixm9EQDW0sU2ruAqnCDD++
	FECM6Boh8UEJtDgtt4B7IfoQhM56PviGGp6ne3ErXoknjnY0pTS0ZTw6NpQ1s6RGGhBCiaDXeVX
	Pz+NkDtIj9dB1RDOROcmq0TsaBHD+1oV9KvandeTJPf+TT10vfmTcLlF6sfXeOSlwl6I/vvB2DL
	yMjKxoOQvSz+Lb3fXiM9thr+b9HIg8Gh5/DAKUBXoZu56iEZ/nksi6oHySHrpkOjBPC70Bh4yrF
	jm+ZBcnanxQM8RLA6Dg+FQ31zYVfT5zaOvpGurZol7Y6cBJ/VkfAoelUp54GYt5DPSnueBJwyVo
	ga1cslKBGt9AaLmG4Yx8wtuzgd3H3lCYT+GfZgEbGDrObVBSoPYkBKnT8Hn2n/3hGUJ+VUnLqOz
	aQQeWU69C78B+DV7RuCKLSy24+Q/CyQg62GutNaDNhBnjl8YEBlRfW0lid8tSFc0G9D4
X-Received: by 2002:a5d:5f09:0:b0:47f:97e9:fe55 with SMTP id ffacd0b85a97d-47fd32ea399mr6710072f8f.22.1785521931614;
        Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm7293694f8f.4.2026.07.31.11.18.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
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
Subject: [PATCH v4 1/5] serial: core: do fallible allocations before the console can be registered
Date: Fri, 31 Jul 2026 20:18:40 +0200
Message-Id: <20260731181844.11330-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260731181844.11330-1-kmehltretter@gmail.com>
References: <20260731181844.11330-1-kmehltretter@gmail.com>
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

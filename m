Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD5472094
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860164; cv=none; b=sap321uWRCSxMvaKANbLsSv5AYXJiAWROHWPkCb5S7dOdgckirJ3gw8zOJzvde2J0TO1iLI5Squ7RDqkpdazipbURkslGPPDfulWruB17ts8AwKIIL8ZocmYJnsYSet7UK+BDK/84ncVvVvDSWHhW23Nd4THn1kaRv9ZgxaB6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860164; c=relaxed/simple;
	bh=Ya5+fvphL83LzsYbeWDighc3P/K+Pmb/K3isgCaZrDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwTqQxvaWx7GbJOOBbAxSiARHaEM+F2+CkYo0lNNw+VmZtbZqIan7Px0eynInil1FNuj9HyWN+vpyaHsi46Sc2wEvreTbQud60eAvxN/WmRwAm9fdRLuXJTMgqmGPLu48SY3qoxFtMmJYbH93BbgKmQwkPIXpGquaJF0OHSzpLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfZyHgnC; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfZyHgnC"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso6251337eec.1
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860161; x=1792464961; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9ESKYxV8GDdBDHayP7DuLtJAcpKYYeJY6d0DDX47M0=;
        b=RfZyHgnCMDx2PMrEirctaBGCFuRxQatKRx77BhfZr4Nyj0ez6gxIe8jMag0p5SsFU1
         WZaROKNUp+WVlnKT3qtehs+11UFSGthVC0zFrQzA6JDC1EKuMz4EKgPKWt053I15dnPr
         aS5EfhKhq9HF2xE5nZo/m4Jwwld4M05JYa2PbdiSTFaIkw0ZODD7CQ60w0ANnfGoEu0y
         Y5RCz4wImEtHZbLUwSSNCqMsZ1WriRm/JvDPB9b7sp7KV0equox4A7s75lxXA+wbdwE0
         fHMWrqjOYnWr1kKO8cioTgS7+SRCDbjRmSUIGvnPq52Bmepce4ZTM679mdfsDl4VDpaB
         473Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860161; x=1792464961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9ESKYxV8GDdBDHayP7DuLtJAcpKYYeJY6d0DDX47M0=;
        b=KXz44o3SgY3UJzVaNmoxbXCxl+D4LMd9LYFkKN21MORAI6T9K6EfFmOhLAF/PSx3BM
         PBjychYeiRXwDYSK9INfa1Wg7ZIW03Gerp2Fxha2KfikI/2uCtv9CqDWyaJYLid6GbOU
         rhZi/BkPvmm1kAj7zvWhAFaTl1AI7iVGUZVCzZa7n5CNBrbJgcCin5KFSOWVpjZ/cQkG
         PqyJuie2CloG0JveMH8L/FHF4kCoxQEhUgsZ5Vsog6F48LAa/OBF5po7uoAZPvEdMNW8
         x77tU73NC/wogjOudQvFCq1wRd0kJTL8KVEWUN4iGe2pz4FyNXnjgo7QXAVsubyZCkAw
         lRww==
X-Forwarded-Encrypted: i=1; AKwUvBxe/pznrcPpA06j8KfTTJEj9JBWPdTVDyBgQZnisuTaFU23pR1hyRrgXfBp/IE32qe7VYg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7sUjiWLsIdWbuxAAoWANKA2MFMO4WZOaPmnyZTjRU1qAARgYJ
	SZWhvcfH3BL2POShIqiPY5fp5pcPrsY/O94e+9EHe/Ejtiq08DsIYr83
X-Gm-Gg: AYBFou3ZKXOTzxdFft96p9k24IdiXqs2bRcBF8lu5uTEERtBN9ZAJ3VxOtvEDobmwCt
	5425vGLDDw1lkms0Ly8BtrAKa3vy+hZpQDdQyv39O/WvaJaJKsTebz5gzzt6UBSAgnw9DqZ9waS
	2nAPNEhjfAk6C2G2L3o/l9eEqOENtsSRx0aB9GPk5/z39QdlTAM3ZWnCmOfk/WwugxIZlCA3j2H
	ErL74hHrOJ2CDLSXEsbN6ccgJR7rhz8kOhhqW3rWpc6R3akph4AaWmy8wUgkSdFPJnIkEOWLLYq
	ikqAHB1+ptPpakxtf7+S5B9A4hvLrBYnuxuQb57OVtiA4cshPCodrTjFRMo7zMLNVjBNRmsXuHK
	L9DpveXMBdno6lJrUHNNIDW5AxlqaKq1hf6creOqYMX+pRatZhzYSGvzdUfl6o07VE4DS9WsULv
	mAGugfRThcO42Jtv8FDpfghcxa53TvUh9G9OVYUwSzmOO3vjf3zbJoh8kQQVTbGnWIUt1Ugu3Ay
	A==
X-Received: by 2002:a05:7300:b913:b0:358:cb31:4277 with SMTP id 5a478bee46e88-358cb3169e2mr16120027eec.28.1791860160954;
        Mon, 12 Oct 2026 19:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:8056:897e:dae3:8e2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm50889219eec.9.2026.10.12.19.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:55:59 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Tue, 13 Oct 2026 08:25:38 +0530
Subject: [PATCH RESEND v2 2/3] usb: misc: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-usb-ptr_err_patchset-v2-2-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791860140; l=3600;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=Ya5+fvphL83LzsYbeWDighc3P/K+Pmb/K3isgCaZrDo=;
 b=hlAZNUAuOTsOCAcw7zt+8hO1U/tGYbvnh2BXSwkSTK86cUrFuDH3pxAH0GwvU2uFV4yX9uS5k
 NwCZWiPoNpnD57qx+VgjuMV4QznO8vvH62NNJ4CmZrOD6ieNz9KrL7c
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various drivers across usb subsystem.
This prints symbolic error names (e.g.-ENOMEM) instead of
errno numbers (e.g. -12), making error logs more readable.

Fix coccinelle reported warnings:
WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/atm/usbatm.c               | 4 ++--
 drivers/usb/core/hub.c                 | 3 +--
 drivers/usb/dwc2/pci.c                 | 3 +--
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 drivers/usb/misc/usb3503.c             | 3 +--
 5 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec0993..c78caa1b57c9 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -979,8 +979,8 @@ static int usbatm_heavy_init(struct usbatm_data *instance)
 	t = kthread_create(usbatm_do_heavy_init, instance, "%s",
 			instance->driver->driver_name);
 	if (IS_ERR(t)) {
-		usb_err(instance, "%s: failed to create kernel_thread (%ld)!\n",
-				__func__, PTR_ERR(t));
+		usb_err(instance, "%s: failed to create kernel_thread (%pe)!\n",
+				__func__, t);
 		return PTR_ERR(t);
 	}
 
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..8c750a93c350 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5671,8 +5671,7 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 			descr = usb_get_device_descriptor(udev);
 			if (IS_ERR(descr)) {
 				dev_dbg(&udev->dev,
-						"can't read device descriptor %ld\n",
-						PTR_ERR(descr));
+						"can't read device descriptor %pe\n", descr);
 			} else {
 				if (descriptors_changed(udev, descr,
 						udev->bos)) {
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index f3a1e4232a31..7ff9c4df941e 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -68,8 +68,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 
 	phy = usb_phy_generic_register();
 	if (IS_ERR(phy)) {
-		dev_err(dev, "error registering generic PHY (%ld)\n",
-			PTR_ERR(phy));
+		dev_err(dev, "error registering generic PHY (%pe)\n", phy);
 		return PTR_ERR(phy);
 	}
 
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..da31e5cea0a5 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1311,8 +1311,8 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	tty_dev = tty_port_register_device(&port->port,
 			gs_tty_driver, port_num, NULL);
 	if (IS_ERR(tty_dev)) {
-		pr_err("%s: failed to register tty for port %d, err %ld\n",
-				__func__, port_num, PTR_ERR(tty_dev));
+		pr_err("%s: failed to register tty for port %d, err %pe\n",
+				__func__, port_num, tty_dev);
 
 		ret = PTR_ERR(tty_dev);
 		mutex_lock(&ports[port_num].lock);
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 759770a13260..1160dc594b1c 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -202,8 +202,7 @@ static int usb3503_probe(struct usb3503 *hub)
 
 		hub->clk = devm_clk_get_optional(dev, "refclk");
 		if (IS_ERR(hub->clk)) {
-			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(hub->clk));
+			dev_err(dev, "unable to request refclk (%pe)\n", hub->clk);
 			return PTR_ERR(hub->clk);
 		}
 

-- 
2.43.0


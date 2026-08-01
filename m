Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261331DDBB
	for <imx@lists.linux.dev>; Sat,  1 Aug 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587421; cv=none; b=bed6vgrwHrVgiGwSb0Ph2bS/1LKRmSLPdS/u9vJhf6pG9LraV1el86gYtpMvtNiy9Oap0k21IBvhxGgsS9nMxZvJUS7sjGHozj4p8gBQRWhdZbYqhsNJ+pZ+bEJYvcoLcoFE/2H6P8YSed027dDwFnSSA2V4XqYk8Gow3hu7FxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587421; c=relaxed/simple;
	bh=EixTu8F/XmrqpGkUc1ZAKwt7Ik8fS3oCoez4NHHuAPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT5HK0Ig7/ve5dn6kWSPvtYsVFax5EvZmXW2f+Vno6w4vYUgOA1tzM8fF9yRitK6zhNgGvi39v57P5sZFh4ssXpRhMPrX5KiY+cNG+w01WJpiB80RWFMkoSWfImgupA9P5g0pRwc7z+G/4K+YwHIzlLJCd78i+vULaeE1mAjwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8EeO9nv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8EeO9nv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1640595a12.0
        for <imx@lists.linux.dev>; Sat, 01 Aug 2026 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587417; x=1786192217; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=U8EeO9nvwH6x4zdCdk+FEsNDVAMfnKT1OlQ5UsDNsoqLw1gOCxBkzsqx03VVj01atU
         5HPhf1IreZi0ERrnaZfdjjgO7Y6PNUEioMWA9YUqr35zt+uiegeI+Qu7aL1FTbFpXEg/
         9vP0383fxKy4kyS4YblQadgcJ7oE6lDyaDB2XaRklv7591NLhNcPmlscjmOJ3Zd830fv
         BGqrNc5uu+u9z/wWfVSPTP4uzejND6QAWYuhhwdvoFB1BNNXjf6ps2UVkPyBENli7g1y
         dwm3X9p4XsYh9wVKICTvrEqmqlHSo8gdeOjkkgFoZy2omASQM90hsms/0m/93mjKN1z2
         v0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587417; x=1786192217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=VBwoi7PY9zOxV6+N/pJIy8dE7Uc0iu7K8vJjGylrwab3VfoUUdECONbyQzWZNR3xIP
         MFj7qQt6IkUP5UUDT5+mHcbfs5K2XQGViaogIhxucYL/CzFCBe+8JJKOu0k3eerZnae/
         jXrOQGWyLt2tds8zPwgygKQNQu8oJnCmGpCWCOg2HyJFgP1NqxOE8G+p3j8Y+fSg7yzf
         kKbfymvwbjamkv8K4pIRz4l4lEv6M3Zq09Gv6wkHd255DZwHDfP6B177oedmU7x/xsOE
         ob374n6+GCYtIvsX/vhlhjVP9z/9zIkwJ5kcSluQq0t2BFCVgweUaihU7d3p/Jp5YJLv
         +uxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowy1s0p6VHCmu758qKMq8jILrz0hQJlQU/0WYH9EOTKUCk+B7nFhYv42ZckCZF2R9pYLk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkju+yRd932lPQMYagcFZHcUNUQjiI1Iniw/BGjdsM+LtXRuHC
	cCSpNAsQbEzgvethR2UXy2qtbTC3utphIGcGx5QE0IDUmEQrCXf3pA6u
X-Gm-Gg: AR+sD11AegszXxq9X2fmXFO2NDbKOWOkFsM+xzlGaB6cgwYpFZzmiXd3aGta/bkQATN
	NYvc8Sxqumo3tLL7qreVvIewPWMbOHPLrNno7wtt8WkCz8B6g/uDZSDEG3n2J8Q1XBfxtnIC0w5
	lHPP/aS4rMyflIcNEQWeoITgCOgx1MYCM89YqnSXNM8mkiUBC236RiJ9qRFMplr6kE/HdDBLUdX
	mr47oUj3kWWeQ2yz09c98lUsR0WgZbHXfuP4VegHkL3npautTKW1ZfN/8KhyerW+CJmDto21NXz
	Nu1Bfh3Kk3On+qhC2Ml7NFWZUGVUjqBsJh7QmFZrtahDUbm+ISSrPuX6h54m9D7FIYBqL+4xBOE
	qqAuYZ7eobzBelpcVa4TT5l/oB/5ISBCiT+suBfPUBUD7mtOA8bGmKVRuf71tsXhiqvGZyN+dbv
	kam3Dsw2ckfshxrDRugZXMsRkZwiiq1/kVIlXc3gleVCRuJ5OzHx06Yc+JXwfWmI/1LkXd/uOsm
	Ds=
X-Received: by 2002:a05:6a20:d809:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3c92a63ad0bmr3140772637.30.1785587416840;
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:52 +0530
Subject: [PATCH v2 3/3] usb: typec: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-3-1698e298c1e3@gmail.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=2871;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=EixTu8F/XmrqpGkUc1ZAKwt7Ik8fS3oCoez4NHHuAPA=;
 b=y9rlU0Bar73W/79icXHYY1Za1xqYHDFPlcRNAyzBdU9DLsdx5ZFdZAtAfdQnYCacrmDjy37bN
 67dNNmpkRFUB7JSMQ26Hj03dv6oZIIwgFS5fqDwVdYCNRhAPyYsGqab
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various typec drivers. This prints symbolic
error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
making error logs more readable.

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 6 ++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..b32f4c433de9 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n", pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +150,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n", pi->mux);
 		return PTR_ERR(pi->mux);
 	}
 
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 89eec20a2064..ad10470ea73b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *port)
 			port->partner_desc.accessory = TYPEC_ACCESSORY_NONE;
 		partner = typec_register_partner(port->typec_port, &port->partner_desc);
 		if (IS_ERR(partner)) {
-			dev_err(port->dev, "Failed to register partner (%ld)\n", PTR_ERR(partner));
+			dev_err(port->dev, "Failed to register partner (%pe)\n", partner);
 			return;
 		}
 
diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
index 6062875fb04a..86d13ab41670 100644
--- a/drivers/usb/typec/wusb3801.c
+++ b/drivers/usb/typec/wusb3801.c
@@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3801)
 		if (partner_type != WUSB3801_STAT_PARTNER_STANDBY) {
 			wusb3801->partner = typec_register_partner(port, &desc);
 			if (IS_ERR(wusb3801->partner))
-				dev_err(dev, "Failed to register partner: %ld\n",
-					PTR_ERR(wusb3801->partner));
+				dev_err(dev, "Failed to register partner: %pe\n",
+					wusb3801->partner);
 		}
 
 		data_role = pwr_role == TYPEC_SOURCE ? TYPEC_HOST : TYPEC_DEVICE;

-- 
2.43.0


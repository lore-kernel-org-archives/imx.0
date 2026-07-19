Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA421FF2E
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784465791; cv=none; b=F6kdL2Lzu8UBAakLDFDse6CeuLeU5XywN8zsFkqBMCbPmq+qmL/ul1pr2GksCxxMohpaFmT05tTi9aNybKJwSpn/uW7cOZmwXSQNbVkd9tSg0xYzkq+tth+WxeD/w65mTmSRD7dYzcc5S6coulprFU6noei9tksCibqqyiplJ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784465791; c=relaxed/simple;
	bh=TshTtph4XpDtLC0dRiJ/OQINrhwR+YX+U/Elo4w8YsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO9l8Wj1I9YTqu1gRHPORPiaplNTa38WOWmtnRnGwtgKmfb402p+b1TpEcxR0Ue6XpxQJ0jSJ3W1lYlSFm94XlPgKpeLQVMbB79I8582jr4cATHWccII4WpUZ8bNgbnN867SYpuKYEdYURrk1jlrN6z4y7UKMkIMB1oiWqvw+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6isP5vT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6isP5vT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e041ea211so7000439a91.0
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465789; x=1785070589; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=J6isP5vTxTvhO6M6qBKXN9Itq26caDHKen1JSlx7HoO3b5FPrXcZjUm1Tz3eW6GZhd
         RHouTKRaNK//otZ5bWCD99V70bqM8XEktD6HU5Xtzz354SCZrWzkMPIbd873LpY0WUtk
         jNPbPeXe0Gs+InpCNRwwIvN3rct6BXyw5PPL+cuTP6GjpUbW3AHjXqb32foJX18ustzr
         TfCE8E+VD8kbTnLnRDn5+XIgqiHfhxuv7wh+NPhXYvZHUXFmoPivPITm6BN81Sy8Hb4O
         2EArmP3+zTHjIOLoKKBoTDjx6a5ARRBg/MSBQbVnPx2piOF4rP0howAsclln4nmEuI3s
         I1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465789; x=1785070589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=L62kBDJiNtGQV0Z0yH1dq1xP4LYd80Gq2pqYP1/rW/idYd8lp5XT1VOCw9eo31Npqr
         nwMmNb6lh3yN/6dWuPEfOtnFQwBMwsUwtBkBzaosaHXetXgVvUuh6UvfNvgglVlq3Wqx
         85L9tLMNqwytC/0yNydtJcULF2Hjf7K3RxBz/xDeiR78I4HPMVaChkTJny+e50Sz2l+r
         2MWHcaL9b7ZfR3EpPXL8dAGRcinzg4Qy1P2w5ub0Mmqr01HpGgKmv6Vc/C+yW0a65TE8
         scDY1OexVXHazMsVbngRA/P5BJQbgyVFZ5TQ8sgwVNEsA5JSSgBYxEoNzhRSZ0CTCRM3
         9Ujw==
X-Forwarded-Encrypted: i=1; AHgh+RpZqaAzBYT0kZabRjzSkeIqA9lvstLDj0XcGUNG77p9sfK15gdLz4jA9NYhBkTVDM4JH5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoNI+osjA0mjytIxoWqXQL52XCsfuBPKW2GON1pCflPB6JzqSK
	rjgyEQgEU1avjmBktnsIdGZqdChua05ruvXX/Mjyj3aFiOpbaXIo7mE/
X-Gm-Gg: AfdE7ckzXNLHzyi3bBESlrWkxw1ysPuJvg9Udg7uo4zHcBtNFwWMk5xtsSkoOSoBpVP
	YMxQUNf+jUnIcrTz4gY9PJuMECIOBT+dbuQ59LaAw5SxgwqvaZZrpeYlf99nq/HNlAeP4v2TuP1
	8bSZa+YK7cq84/r9PagWdvIbL+8ZfOfsEYFgWwSkSlcVtr/P0+x1h7lDuF7JmBvK5r/Wk5LOUW1
	3A6Nd4VKlTwfqJyFwoVfnoRU2Pp6p29/M0nP4PlrS8YqaAWV3vQUnifM9NxDL/iX/PbHNuaZ9ct
	58Ui6PLPEa0Ch8Ffgimez+il2PglMJMdGLK0ROC/me7oKOSbqNZYzjlmI/5mp5RuV9MzGoHGqtT
	1Hv3u83v0GSYRbpi7oJ9Nqyi63EfG8IdY3+nM26zqu4tvK3+79iXRAGXDTdquJd2AVUPbbWGFce
	22zQA=
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr11187005a91.37.1784465789205;
        Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:28 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:48 +0530
Subject: [PATCH 3/3] usb: typec: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3117;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=TshTtph4XpDtLC0dRiJ/OQINrhwR+YX+U/Elo4w8YsU=;
 b=rOqRg26QyDZf5559WdNDPWAG75Lk1bUfU++c9aZ6toUgJ75Al395i1fAUcJgGkaQAbCTmnSVA
 MlK66hcnFGXCwfDAeiZvJ89y1HvvgA+mdLV+wyy9OEmYm+j7FFo8UZW
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various typec drivers. This prints symbolic
error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
making error logs more readable.

This patch fixes coccinelle reported warnings:
./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..a2357a28ecf4 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n",
+			pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n",
+			pi->mux);
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


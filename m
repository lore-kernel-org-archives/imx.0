Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C313EFD09
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129878; cv=none; b=CVgfxvccYc2I3iCoSXLXLsqULQ5PBC0pqrmk8srdN0TGFAPBLo6dJ2f8PTh9VJfX20IGutwZYV40LKFukmE+buUXDb7AWKuq/wqKNJofXQhB9khgoCtiR+/R5BcISlE9B5ZV52qcyofOh9MNLbWt1lPjM0pXbnK8wyuMTGzxS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129878; c=relaxed/simple;
	bh=TodRKnNtjx7goYZ9pZValLwSYYe0U+36cHd1VYB3PEo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=pDA7X8yKkQ5RPx6ngxjkecn0cCtXILCzl/uykYHRdkSnEKedeV1zLrDpxNLHqMJmc/ay5CR7imHUAlTKRbPfRMOyMJaCMUbzxZxNPj0I6ljuKbzLvRtGzbgqE98yUGUrJeGjmYQ01GV/r/0uGGtQsN8+eB1B3TKjgwoZ3hUFGG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XZ5AnqLd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XZ5AnqLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
	b=XZ5AnqLdl20y4JBd6TTN+l0MOEoa50P9+G8YgkWc7j/pXWw/eTj7xpWNKYP2LQvhWGLaPm
	x3DJDd0BGGsD8FBILLpREVe0MsOEV9bv0CmYZIjDDx4oWgyaCA8pjTXZ61xLDEhFBIyUOC
	JHtaPWqRrLpPRteJqPXVuf2P2vqhinQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131--SssPeTZOGWD4SGfAB547Q-1; Thu, 26 Feb 2026 13:17:55 -0500
X-MC-Unique: -SssPeTZOGWD4SGfAB547Q-1
X-Mimecast-MFC-AGG-ID: -SssPeTZOGWD4SGfAB547Q_1772129874
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4e37a796so742882385a.2
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 10:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129874; x=1772734674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
        b=md/HPxuViIB/LnqPp7tKf3UD/nJlibGINChk8vtqGkTg5jmdcK59FmFO2lv5Qzov7n
         w/sL6c6S7owQWN3L6gyYR4a3gVYhHwUAxZbemwu0eIvvCwb9Gd3aR3A17iyvh/e3wpYP
         AsrZL2DkkNV2nrvx3VutDE7z444vww/BcMJZG/ICmBuCRtwv1YUszgdsaJsjN9nr9O/p
         ADPouj7TbHE0k55cm5TFbVtzuH6Lxour4fhyO//9vv9RbNIHsG4rYxhzsoQenB5F8ybZ
         ZWa8A5bFivYHmrL+Aof5OJkD17MQWdBIlpOJbKCSEo3FKbmAYYkCQopZOlLLu6z+7wic
         CqkA==
X-Forwarded-Encrypted: i=1; AJvYcCUXkGN70CORwFEntFchkU7Gw45GJDKkUBLl+spWxkX+C0qM1TcGPQbNEb5WVcQc09v6iC0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy/hk6P9BV2UtEpoFY1QxsfIy/nfE89YpnO5bbR6HWlmxjMOAv
	mUPX9Cml70TIqLbi/XqAw2KADmgJh2LlGq7vAo2/fBmgj5MDZdIzTwjTB5+kszN04H9zSNie7N6
	gRG+Scx+jRELOSgxQh2M50bcJUVIXWnRM9ojUZZCShRG6A5WTV12/4A==
X-Gm-Gg: ATEYQzyXY1AKEbaBwUUirBl3ZQ3RyA39Q7x1R/b21XmrH5sViBnJ1rE5jjh4NIhLeey
	PGWoYrW4U8LB3wMH+uqW2+BJqhk3DplrOqU2VhJC7vaXsMZMfT+j7f8z7YMeuYmEnGY4LBYM8aK
	fvb7qUxxVa+dKXz8zJwSUW+SAj9y9ITHieLuSq8vRckcUdH/FBmXzbe2K5SUnZFyZT9+tdrFEGa
	Vj/8/jYQ6eq99nT3RlioKwc7tViXGOcHIM30qgCkx/GoZcDnkkEv0cBJoZokyS6fUCTe4f91BMz
	zpTXmbDCJrNy4Ag3FSuvtcrrMwi3vJ+4/gzdbes7hZLkWVB4qQh3xhXqyWXrC20EBIa719IEaOe
	8celeT9w8QkxCfC2kVhemIz+yI92pDhYBOWs16b3+OnOgnz57cWJGQrK/HptT
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555085985a.4.1772129874495;
        Thu, 26 Feb 2026 10:17:54 -0800 (PST)
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555080385a.4.1772129873991;
        Thu, 26 Feb 2026 10:17:53 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:50 -0500
Subject: [PATCH 06/13] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-6-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TodRKnNtjx7goYZ9pZValLwSYYe0U+36cHd1VYB3PEo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Omz/9if9mBCnqkMh94+5yWMMk+cJS1CyharLw//z
 s3D1BDYUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEROJjEyfBaTZ29cWDSZS/HG
 x7ORv9LX6G4MKXByZTmjdCi607FmBsP/oL+rljKc3tHXVud4P6Il+PIB9dclEXF/Z0Yt1b3lvPY
 NHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZMTKBi5ui8qyR7S4U-OQrk-i7WvcDWYKEZ7qiwz2Bc0_1772129874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a85ec48a798b58a12f893587c85709bbd8476310..a39c68d664655537e81df55c7e6d32304de9338a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.53.0


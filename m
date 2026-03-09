Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AE3D3323
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067179; cv=none; b=JuN/OVo2BzzcY8QreUNqWjHCk6jwuXlc232CvU1gxnwaQCnBZyojjnv0OdQRPxbojpefs/NDNusIQk4V/ebA8PCTR3DgR0i5OxlotheV0ZHkEVusRkkvZw780EaZdFqhYtz4Vq7mmmuJ/hJtQBZInsI6b4yBVif31fgvYm32MCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067179; c=relaxed/simple;
	bh=uC9B74/6YaJgtC1tOqhWle/wJGIWD2whJTfl6Yd1DCo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=jhjCfnDImeRZBpC5Sf6m0FdY89vr8B6AGK+FVaE9/OZRNk+pDR6h6ro97k9kjtO6EXkBBZBui2OFM0cNVw5SAs6FTNYrCtMVe7QU3+EuoPJu50BQH4/b977d+deOcyF81OHKZheH/BERkp2YVMA8g0DnmEFQiTsoS9Ia5pY1Cpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoHsCX3P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoHsCX3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
	b=eoHsCX3Ph1ZmEwbImPJWVWXjVf6bChbhSpFnGzCJi+rjaf+391LOuG1IXd83Rto1myOGVM
	6ORGq62C/7z+r7l0b45QCOYIbZeot9iXVLLM4jeHCcMPXIKSbEkYdIR9VUdoxyZ3LrUyFu
	1LDnJQd8fuufYszl5NbzpVp8fyIAviE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-HjaZwXBxPraoXpc6AzonUA-1; Mon, 09 Mar 2026 10:39:32 -0400
X-MC-Unique: HjaZwXBxPraoXpc6AzonUA-1
X-Mimecast-MFC-AGG-ID: HjaZwXBxPraoXpc6AzonUA_1773067172
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd80bea54dso830629885a.3
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067172; x=1773671972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
        b=sMSGrt1qOQyYOVMxOqounIz0RXTTO7CxpwJvRMKAZpEQZBm0vD+vXSe/2yAgZusx1u
         mCNXjzWXQ1UKuuXhSlYgxC+GJHgpxDjUBF5oOclZwkL6RMxPddKEEtA7Xm8oalRa8/x5
         5vULCxpxigzDhuvB6UILpxAEgm4vmgKcOqb+18v3dJIT1U5DlNu5tTbCb45uOj+Mb7vg
         33z5sbkoo7OYC6Yyosyz5jijJkWr3tFwPyDTVb9U+AVxypuh0ybLJ9iZmcGPnVMkNEIi
         SGMwlLniI/DouUjCnmVhmgWGaJAJZlW8GqE8BQAvbLLVjysO49yDaqdx49ni3/DpPj7L
         xGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXflhcUEMlrYUvhXKuqSpRuZ7Q2GWJaLtOTiuumZvaKZxDn/9kvgeVv7XxWVzs1vMvgZWA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWZZTjWaRgPB7UizqLWC1XNbAMN0kLwbxW2Q+i2Vz4aPKLkXjI
	CalLfGqg1af+x802mrnBTqiqErIq4RDcn0wuZgIeyZXlcewf0LYSS4EfTTK6HS4f5JI0HTC+8Ia
	zdyTeEOdZPa+6E/fK7TkvaNvBjFwGDGNbvOZRiRhP1KmPArHAGd44yg==
X-Gm-Gg: ATEYQzzei9+aTYSVMr0/9R6z3Famkl/588DHbVeGYNeXia/we/MS3SXq4kjtpx5zava
	BwCVEFY/veLyBGm/H6JjjpcwIi9JoYjF2lU3yYt0+a292xvQkNmCDOWenK3M1uLPz0PPD/OKGrr
	dyjwZOubJXvLaeMgR3uELRtg9rehYqhilMsECN+aMQv3xLpZKBFFfYBSYXgoIMsdhhItT35e5RB
	QdpsVAUsgABCOU+fAA7r1kOF8nKcV3N91AmPSfBDkgW5pkzBw4ZH//hzerQ9VtNo+GiQyjJJcgY
	zt3LbUrXZbRAoYFyXgKrVbIZ1ZOVxJX+2CR+uZUxcHyNlFOnAGL2YpFDTZTTEYfXCVR6372WJns
	dQLBwoF+9y2DF2Ad1/xQrmhIPxUsAsR4xoQXcVNLydzkpcwbjIBryamEf/eWwxg==
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391296885a.8.1773067172090;
        Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391292985a.8.1773067171586;
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:45 -0400
Subject: [PATCH v2 06/12] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-6-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uC9B74/6YaJgtC1tOqhWle/wJGIWD2whJTfl6Yd1DCo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z7w5nrBvNsrTNMf3kl1rDhwMu7USnYjFrM7VqlPE
 9822AYKd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRJw2MDBM5l//X/rRn0Qm3
 pYasHy02rHWyfBlY6LnwWt3DlAmhvW8Y/oc2pO0tOi6vMcFY/sPuqitLmx1ZUzxdnfMbDDx4bQU
 b+AE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bUWSmZJ4zTfjvscDP6635-S0ANLSMRsp8dkz0MWWBVg_1773067172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
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


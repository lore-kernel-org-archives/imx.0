Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724943C055
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612102; cv=none; b=hg6Y7x7II04niEw3fSG+2v0N72aLlvh8d+8Cm0IUc4t7RAAABXu3BnApeWHgRQtcVpa7bZVi+dNyRrrQXJZXXSC1pHH1eSpKIURs5dRjcuXrdNQXgoIXw64d0E6tgtM0copQfnNcwekpQsk4oFP8jgfiyX7nbO3YefZHODi/lco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612102; c=relaxed/simple;
	bh=6S8wuEyltAzT8/X/ySOKtLmdWupADMGiotqEpc6gdtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udDzLh3qPJeaWE7ZfJ2Peb+0nVOP+3tEVpcn5jZTDEMbimhayU9haFShFSBlvZOZBYdAW7l+RyPuL9fckTobXZ8YJp6hQ0u4rHyTpH9aVjkOt8RmQ+DGFb2YeGnBqZ2HKEtJZ+qIpQ3PAQfUBzi8EuLLoKMPm2inrqfNWX4AUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJFyjXNd; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJFyjXNd"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c855599a77aso2210148a12.0
        for <imx@lists.linux.dev>; Tue, 16 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612100; x=1782216900; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=qJFyjXNdUJfC6DXvIpF1BKZrIotylyiNX3hZDQVFjAOCGXVAWVENDG09NAHeIA/cBy
         hWlifs3Fhq5YDukxsMmY7UaFqrkPaNBSCXTk6QFaJb0hCem80lgOMnJtem5NNhgxjWmB
         JzeXrSZ1ThYkEVePMqCIZzZP0T+DejrqdB9zoD8uDED9bX1O2EDzVs56OOOne5269yr+
         Ds52z1lB0HCtGO0Z4vXKwd+G39CeuT2Zw+lNBdY8oVfZmfg+X4g5sW+8JCqYcoLpOAHT
         bTU8jd/7ZAEHy+eUC9hSFISyPn8DOhpze5uRAV8TyjyBMEEzooVfHZWH3pHiFQxqXXUF
         QVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612101; x=1782216901;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=Txq0L0W+oC19wOq4zBB5efj8AWswW6jc2nPzfOOPoCH76XEIKBOQinuNko2Bb7Tel1
         MnYh/KBRWJRcsok3dJWhW38StxCF33eNgaqT3iZcKvpLeRNIWb2V5LOBpDWN0FE+kJSG
         Jo2WdBzm+pYPcZCt2eG4hAm2/2vL08E/ITjrNrflM59/sCVrUAb3SMNMP3KaRCakaxYb
         2OteJmerBukhXkMhyeCHBvg1y9ZrnWe+6/PbawBCiVyyCVWr0WTvZTI+LkIZHFg/QA15
         Gbs+esT5VcrhHB2CCnkyHzmqWgfeO4akXb9buG3PDShl5vxejAncLFIMQXb+Ia89Gwfk
         quHQ==
X-Forwarded-Encrypted: i=1; AFNElJ953htHVpDHAALoD0c26g6iaFH69DOpuEzS245CmVLtwLbdczD86NiCa9AMJTBD/OYQ3jo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ1KbA/LBPOc0+QER/z3Fsot7Yez+Cf6sXi0/QgTRs0Han6fpz
	ux+bCDoUQm8i9unuQZG299Nf0qwC/6dctajJBwgZ9W9MvZjM9G7/y7Jbrr4ltiJl
X-Gm-Gg: Acq92OFAQrct9dtsYH6JpJMana2zw9IwLQVdMG7ZyQykpszv4PJ8bb+QbTqqMUK+rkG
	xMM9HQ4VPuIfuVbpo16oQV1OeQKDmtLmTdNJI7gTesjB62RoqsyceH06EBrZ4q8AhEP78fUQWQ/
	GDZWwJS5LqmCD1mY7TyJK4nSsVxRp6dYjH/3ZG9u1NP5KXF2LTCPk3Pgkd0oK3+94goa5AFkBBj
	Io6ujd/lD8CoTrmklIojjehYezjwN/Nag3aen+OLUqX+dTyTrNYLdQwFofFlL9gGI5XXJIqHHHq
	YLakVXGKS1B1qLyWqVl/XHvoo6ZQOR9dwuGVx2tCLEsGqFR+je9ARoCcmNhssFIrAt3k+g2CDeG
	Egq7fvto6iEQ408bLYX8/v1/7hoEZUALqb58sTGnaBGbquNHGP3P6y2ry3ikoAmzBIvm7Ybk6i1
	Vdf5xx5z2bJRvdpSWYAsFRgq9t7gmRJslmQ7DYOILbVoYC5HUxRqE778qhxmvIx4PuW8rjaD1/P
	IUSI9qh+qpeFCTXHQ==
X-Received: by 2002:a17:902:ce03:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6a99a5426mr9079815ad.7.1781612100226;
        Tue, 16 Jun 2026 05:15:00 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm135118355ad.12.2026.06.16.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:14:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 16 Jun 2026 20:14:49 +0800
Subject: [PATCH RESEND] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pinctrl-imx-v1-1-777c14cd2858@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781612096; l=1643;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=6S8wuEyltAzT8/X/ySOKtLmdWupADMGiotqEpc6gdtc=;
 b=Zku0M2FJaEoEwwEmrCy//KeKEm/UNXg9nSoC03e69VuLUmDz9Ml+HSmsuuOUOgc4xg7mHQJS5
 d/LUhvYU2XUCGf2+Y9u4oXQNobiZ7p+MVx3pW+HgMzZyL+314bfXKqO
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

for_each_child_of_node() holds a reference on the iterator node that
must be released on early return. imx1_pinctrl_dt_is_flat_functions()
has two early return paths inside the loop that skip this cleanup.

Replace both loops with the scoped variant so that the reference is
automatically dropped when the iterator goes out of scope.

Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0db..4a6bdaefa42f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260523-pinctrl-imx-b198f8391abf

Best regards,
--
Felix Gu <ustc.gu@gmail.com>
-- 
Felix Gu <ustc.gu@gmail.com>


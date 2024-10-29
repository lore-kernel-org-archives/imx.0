Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B97205E2E
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203374; cv=none; b=qVZryRrBiCeHyowZse2WHn3fr0l2PgpsgNt+hGygl9rsuvi2etBSEUpkCtuBU0zn6PzSe1gq3mPOr2xorshG2/I4BIltR4OmUujKzNfNJwgY7+TKKSXgHumr5I4ozTwKerxirq8WeYmsaT66QadGZNJrvBXArWcWNsAQ9mQQXk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203374; c=relaxed/simple;
	bh=ix36Ypfa4HSTVFew1jKjxGav4UwvLvRrA/ifkmPtQdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZLyZMTZg3LVJ99zfMt8NBSszYICHPdJBuqAJ2haG2+y8anRAH7vdb4cZxb5AKXuf+Zj2xF6ClNcTNBUZi7dYooUW45UHLUaor7sOSB0DHpzhBdOaa9U/zSq6nlVe56qk+KU0v1M0ZDVD46/a5Y46mMUKYF7PTxrf50fmBYvNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHe366V5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHe366V5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71ea2643545so4348218b3a.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203372; x=1730808172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
        b=mHe366V5y9s982LL5HTlfKAEN0CE+x/Freo2i2F8nY1GAGKnsVEaXsx8RBPsa2byeG
         cn8IFZ1rjTIuPBlt4qQS6CNqY99PMM/SHeV4CGwysbEVu97Hwwcxb9A6mbZ9XfalcwNm
         lcIZlQolOesbDs6LtLYetNWw8phnAfq8HrbwyZkOIxyHraDEzVeSZA9GCSS+K0SLvIpS
         AOTWf7K3/GTPAmrTs5pF7+7+xNbpll9jClHFTFYHv6G4/aFBCTmTmqUoOuyB28FY5wAk
         MQLtiHlKKiaLUnF372fYoI5ETofjxsKVBFKBkPME4du6C9rLE6/QGCkTik1MmCy+G3k5
         PlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203372; x=1730808172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
        b=bo93BzOrdREwvRu8sGHcZf7U2JQw7u4YHQQEk4AGThUPZCbxzsdRaEw9KFC6ZK+uzf
         wc6mOXDe2aWkliw5uMvwdNAZJsBnbboJxUX/U2Rx8fpok6HB4roK+ZwLw3bln4UC3FqE
         Dhu0b1shSXujysHHczPVcxSqPu4t+bnFRSEzt5yCpdZkRE+6p4nWf71UPv4+Rh07mQgI
         thIolxrBFB892W6oqT2MrjF51JlJXTSzeyS9AQX2+sWzU+0mp8jDF6zSrzK1Wyt48IaA
         vn0ouM97N6Dclwy6eR0t4uOTVnRM6IXCfEfmWBuylZJvIzaBR8jTdG/+++w1UqJft5sn
         6cDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXenSSfhF6NezdaPOwv1oGUYDdRT0jnI8eSE7r51ai7MX0d3ihIo6L4l1zaa3DU2REHMbE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBVjcDa4FhKx0C8Z4KYMmYFoj11CJc13ep0hR5lpbe8bcpdB54
	peDHvl98TBDU15n5592yv+uF8J6VYE7vwUUGBlKcGVx+SMq0d5sy
X-Google-Smtp-Source: AGHT+IGSaPWzwYRZBKjWD9RrHpvpb6Xg8xbKX+Ux5F+Yk2959JKoj++AuEEpzabc99znDi3atvlmfA==
X-Received: by 2002:a05:6a00:1703:b0:71e:5d1d:1aa2 with SMTP id d2e1a72fcca58-72062fa0b5bmr16981266b3a.7.1730203371964;
        Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 09:02:35 -0300
Message-Id: <20241029120236.299040-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll. 

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 .../devicetree/bindings/display/fsl,lcdif.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 836955de3bc9..08ce19638fbd 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,11 +32,23 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - const: fsl,imx6sl-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - const: fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
           - const: fsl,imx28-lcdif
-
   reg:
     maxItems: 1
 
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708948;
	b=p6TToCgY2EGrJcAJRSLBYYAJwCu0k7y9FoFKiA2+i92RP1JScMQquKHIwJnxDoXsyhpN
	 kwpEeaMeAKzctoDbN+1s0lHsMdO2Fl0fBBeAyiJ3qD+jkiUK86hGUROr5orlSaRNw+PjM
	 +BNCov4Pee4sn7am0XT8uPDXdLxMQ6LSEEuOQzIM7n42WEPIxj9hwkCBVjpFEurjFkWW3
	 ueIVPodGgofDJEKP3qU5wx2MkYJgLaEz0Z3slnHVCDNbko7++gVkX0J+em0AOrD4jUWUw
	 LSAKTkx6NlYA84YCnKfQaU/gx8cTY8mIz50AjtCieZcH7zJFDbZTN0E9+7rpgAGyKtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
	b=05U4rKJkXrYPU4YgTlbnVrY8VPdjRJRH1oS6M3pO0AZFTmvI99u1mS/juSvTD7uxqI9u
	 Ik+6xCzxrR8a0fSdy98sgVWHPitTPxrF/s0HZRgRB1pRahHmkxI7eLkHySbqFWK3P/6HI
	 bRzjHbTP4hma9DI8oj/j7wmYStEBAeDV4xuECOLqpn8U1w1i5us3Q2iesSfc0/0UjJQ6o
	 EXYb1fWeAPYDnCEq1pu8gIBRnZc/edoixDLK5p0j7NZ6sfKW2Ndj/Cb+RIiOzUFHUi5hI
	 dnHWbVrljIIZSVZa/JUEotyTnJzlUU3KQJjkJ6X4QTEnwA2c/IkREoQgL0sH+R7XKVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNAjgVqB;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFF606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNAjgVqB
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so3210303eec.0
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708947; x=1796313747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=qNAjgVqBInXceY+Oxpz1YsdpvBkn45XY/1hm7kbX+UW9BWpLwccXckoLypt2WCzfDG
         3NfJdU9yYKadoL41a021E+sAaPC8iHd8U3uYAbEGXR1c+mhsYaMYWWhxv08JZqwobz9c
         oEGtGhx1WOr5DXmurM5i1Je41HxkAop5QAuFylbOqHQ6PQYTWjHJ5FMcIhFqvkoI2Sm9
         ayP7S/esI1GOO+th6oUXWZuT91o7sJehLEQVvK18/cWInJ3Kk/NLGadVWQdxR/726Lzs
         uI+bc6iBGmFpdx5Ju6+XshF4LFEGWRv7w//UrXNHAgsJStH59/n6He08EJUMlQEx2Orv
         xGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708947; x=1796313747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=UiP/Av3zafevMdNKSyXOHoW9X6cgKuN9i6gAq3aMHKeJcCAuTGqbVewV7BDnCnvaOD
         hAqqBhGkrHYc6tnAG712205B3fIq1whfWxF9uJ1wC1wyH4pVDKIOCjR4JxxORTod9H6/
         V0h3LOy5YvejpIp7+qqaJnYqjyq2rzAqGHBkkSOQrPrCxayKlFgh8i0DzHqRmS8gU5s1
         X2OcPV0lNpCsjJ3UJtLSicYj2Mnt6DBNIwTqb/BYVUTMetcwymWplPAe8FMHpDNOnFTy
         BKixEE9q1X009nD+J/mQDo/6h6oHOARXD3sEL7qN9wx5NKfBe4HVSZHygnfCoosN3r73
         F1SQ==
X-Forwarded-Encrypted: i=1; AL+hErGlilFvRJWVTwpI5ixYI0qmkoO8xzn+7GRWoP7aAePSz+U5KXPOauOuBTaYTSDzBKVS6Ds=@lists.linux.dev
X-Gm-Message-State: APuU4Z/DfpGxIm5ImnCdmInD3hkbSi1CBPWnTOa2BEu+659tT3zN56tH
	LsqLoB7p7yoOJmwwspW46JKa9BP68dV+u5CqPpv4STiDIuz22eZZwpJv
X-Gm-Gg: AZFdTZcTdvTImf2CZRge/LMHdPWaCTKZWVMLeXx70KvWE/fTF+bxCY+N2NawTCr5KP6
	qzk3j+hTwti11bwO98Qm+aSbaaSXBQDs8tMJqodvZDOfAcrtiPZgD2Mb9iyeHlNnjsSUQcWzPP1
	K8iccANbkhGDlnsf8bLf2/MPimyDH3UmeL2a3SfVG83MEkad8W6Hf2JVFilinxkX3G30IC/GI5H
	IGU+b84qnmjQXuJKVTYrQHqXSxOZ/lbOih66elQFkhjfxQ19iY0UhQ8NDck5s52JbQV5tBXmRMX
	PYCjdNmJouaRYGHtMLAvszj1HJF9JWYizS1yR1gcu/8awIap2q6VQHPBOivUZHOC2GXR092VCcg
	JsipF5ihL4TPrPrTgWp1zR4iOsJnXkvkLO2m+5wI7nWhvCkj2oKqS0rkZwbgnr4c58Div0y+DQm
	02ejv9bxvsXnd1mxvudH19D4cQXrjP34zeQbwo8MQ16T+qfLNebf+Td0AV5wCjMbcEb1jBMTXf+
	5lR2v6+9e8Thd2LSqZa+Dyv82S6IszADAcxQ1LKlSGllkXZQcNZpoDPwcH4kAr/t5P4R/Uc1sfb
	OnvtAZ2h+HopsUOnVyk0BG8ljzINzomPKTWxhgT6yuxe
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18511297eec.32.1795708947325;
        Thu, 26 Nov 2026 08:02:27 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:26 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Thu, 26 Nov 2026 21:31:01 +0530
Message-Id: <20261126160102.52163-3-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1


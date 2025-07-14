Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0A25FA13
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506088; cv=none; b=tBbGD1e7NOZHDJsQg7qWmEJh4mclLooNbrYcD9uNlnCRdIkygxLA1LTfxnSvv6BzmfB/UzNSQbWXfMzQwIwdFx+eqaE8XS4et5l/sOaX/28C0DlHs3v77XUp5TtkneoD+C34NBCBkQ32xyTxNoMIX7QF2926a+6wpYAInqH8PpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506088; c=relaxed/simple;
	bh=fS7UAHzRAQgqQaPzwCc+k+6GCD/YdtHZbQodaTOqCHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=irr+s3jd2vtH5VHNMU1zcavoyrXS1NQsGuMN/Lug4BuB5tNBz/O4awhGOKn7DsqXV6hYncNDGqgT5g4VebTNKNMpqQyHdDRuC8RSvb+/RO1tMAxjLvP5H8xda289JieMUkhW4DqCzFty0sI0hMIBI2C5iCKcUyn4D9q4674+qkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WALAURxv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WALAURxv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so880645366b.0
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506085; x=1753110885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PeQD1Y6qSI8rBA+Va3N4iXrKAhnjsutZilvD5RN/6Q=;
        b=WALAURxvN/f45+Yd88Co93CPf2acQaVe8tMbhRKs4IBHnmazPc6rE+y7JYNMuYi82x
         fBl87h9BZLWIJ+PaniDIQsQq5uu2nXb0sgzlwr2YVA3Txujwg/PTKfKJlBbA5YyeRhVS
         ykpzCW6IoyTUfMI/35Tp1i9hj8MJIHvfpKQ3I450wCM+1y+fh55fxLAP0H9CInjFyiQQ
         m6v5FgsUbRr84iErPgCV5SU4z1r+iJWP1EMDX81hwZz+wbXx6tOyqcfElPsIQ4VjoXWm
         PIfDBM5QwHUcDtlD0KP6bnY3K4S/fSmVX7FhQRjVbbHEPJaEDDhcGn+UySGvbbAwPszq
         pJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506085; x=1753110885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PeQD1Y6qSI8rBA+Va3N4iXrKAhnjsutZilvD5RN/6Q=;
        b=fX+ND6kXHZOsXSlfN1CLm0JNPH+gjkU0lP8VNdbeQgnCYiT9Ch/5Fw8c6HnjXIogJ5
         3zRNjJe6WEXxDfagXNxYVO1IV1Hu17X8DwTnhy2qvBo0rS3XPEFF3Wz3Tb3Szj9/Zjij
         FJ/wFYkVhK1VBOnZf3EvSMlsNDDKeg11jnqNsIGPKMfOKv4+YdaEcq41AwMWI1nsSIZj
         goIV2XaZfKGp/TwTKxRv+RQKHiKWh1T2LG7T4yeU7HV+rie3NLny9+HDzPkPcGUOAA8o
         qMYAN//LLMKYfHZ/aYT6K01YCi/uwkKW/7L48AWAD5UDlc+WV1brvqbJNhu2BmDdz9rW
         UdKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQvGU+pBCx1wgQekDmUT8EL9WbYPcgycISSOWRaUqOVt31BZ/cc6IEkpcm18IK7oQt1g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHBVu836Do3xqw1Gcywp9msT0afDjfM0Sc6HRwABrI8mo1toSZ
	mDM6b1vpYDTeUiTHjFf4FUhzUEWPAzT86WlQ/i9VQMI0MM4feRO9wh2T
X-Gm-Gg: ASbGncvlHn5rZycGKOq0qxcfEbY7S1hx61rMN1asHcX/HPBTCvaSVNpXSxOIpUznklh
	JseN+TPbijKT38Gz2iXeYYWqBS6+BrEkxmmiNBi5/AeDWYuyYdfR2tjIPMbHtAbq+ljsBNDgu1/
	73nZ9C999darMJaUaCRKd6z1tPtNcoLcjjrDALabXURj0pZYOrUIOv+RCQ0O0vAxbNFJokREhsW
	QRUNTeStftTcuS4xanfrNJHDKp0VdFcKe+v6+Ej+ClgwkDbEoGQunxtclR1BmGD6DeT9pmwd2s/
	cSgWwihf32H+bvXgFybVzt31jc2K2+FKxVVQgVzzLNNGqdrOUAwkctilvcTV/owSMtnEkKgj5bV
	fZpH3SS/mUh7Spb29fG7w0X0TDcJTrQq/Nk7PTYOsB5wYriCDqtF/LbbpGVWMeqCQIIU=
X-Google-Smtp-Source: AGHT+IHbr1DUfsxyJQ/Rn0DnkunJshTrtrZW0VywVHwhgB47bSh6fWGAKYyG5rgMrlzWkWy7RQNqMQ==
X-Received: by 2002:a17:907:e2ca:b0:ae9:8dc8:511c with SMTP id a640c23a62f3a-ae98dc8534dmr626945866b.13.1752506084433;
        Mon, 14 Jul 2025 08:14:44 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:44 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Mon, 14 Jul 2025 11:13:45 -0400
Message-Id: <20250714151346.7575-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
References: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a3e9f9e0735a..18ae807d5950 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1382,6 +1382,7 @@ properties:
       - description: i.MX8ULP based Boards
         items:
           - enum:
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
-- 
2.34.1


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF4367B7F
	for <imx@lists.linux.dev>; Thu, 21 May 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354235; cv=none; b=pa6yuLmH+kLKuF8AQRaf3/lnSN3Www/Ix0X7+qbBEm00Xl4JzQ1uz749hom8SJwDe5UxPl7K0YNLSADmuaOxMscIgbV9ifvImo9RqiBMcUKdUZpafRn1JhmpRoL3G5hwhmOCQgICkq0et3dLwnASKV/Vv+rRDdweTvu0NRlsnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354235; c=relaxed/simple;
	bh=utKvz2pSSj71JvdOn9TmwqnNZ0nsKBa0WY+09/l+KLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiPm6Cpe0tmQjCh+asx+pQR7LWpU3iJ1SySMQMtCORu3vEdLk4nluV0DNh10LdZf7OIn5r9phcL2eDGIN7b5qeFME5F9+N3VrMOXTu/FpDMAyHosFuhCZl0h7f2r+OsYa2q4Yn6MqIQNzGCqJIQGuLpDBIWs4pHLhoCrViLjQ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcPiW3mo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcPiW3mo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49039a8851fso3309335e9.2
        for <imx@lists.linux.dev>; Thu, 21 May 2026 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=bcPiW3mo4LiMLGmbf8nFqgPo3PXDQyhekCbpq8ZMOLMuTRP20toLkcqj5qfFJRvBmG
         h+o63jr4K2KKLlWMR3u9LzxqKoq94b08OzrNu7NHe9uspLqyIMkca8VtQ3Z3lABl34dd
         T4GLIe2g3q6Pc814k1gvsTXtKHmaMDg45w2/a6mzpaXQD/6foq3/2WU3MaxFwCvhz5a3
         PygEaaDmw0GLFyg/v4sZYqNlVIMbsWPAB00fzN7fW2bsnbo4T6JMCllatI30eqI7wnuy
         meZo2HMaI0P9OmPAKMxyDm7gfDJ7toXRb/IIq78zlfn9WP+5QfZRib6CWQiZ/MLT4X/S
         +T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=S6Baxp+e07AW1aaXDCF/eIkW6zO8OUReervpFSWqkyubWwGo7/g4IJpSt/8FbQxhsj
         SlQnpODBZh1tm/4BkOosfoVj6S3Z5EKNbmn4kKiHMwMx2ewioSiwUkxW7VHqVd81qBEz
         yAx35/zbMwEAH07lKnsW/FuR3sa+7X+IXHubcOOFg7fAJbehPmG3ot1v3W1Qroc6+2K7
         oVr+rji7UFuNdLbMJcEuETQ7b2lSXJBpUCPeePLaFLUMHM1rNmj9tyMxJZN+CxHuM6/k
         3rr/xaJDBo/CC+JMn7x7oUqpvkvXeibHHFMmg+ndBa2qea5tJWx2wli1d0ngZzrYWEtv
         kDJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dWnpF9O7RQkDwk4xSJt3MbDrCy19dn3ndh3o0/Vb2UDRDx3dcjciy5xHch0ZrFK2arJw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbOuncugU1jb9tYGE9GlgvlUy2m/n5AhMZrs6CjpFiy0edpQ0y
	g9chQYR/ChdJOFCC5YC0ZM0o9BItZ3EdiAzdSy2YAOP1XlvVgw7/eWl9YfsAnWRX
X-Gm-Gg: Acq92OFvRYU5HrWKL4FU3/MDR77H6fOdbL9bBzBdazLYc0hXB3b7MkKIVCV4Lk8A2pg
	ZclXXR2yc+SvG5EcidF+PSlI/pJvZScGOYjg7h/PP/9A3M2EHiFUCmhT3El6iGQD4C0Y7YDWo6i
	bQHxnxfaDbB+q4M3eHAWJTJcxIqyX6nh2cLtozSkBytKhEKLs3v1jnftIZDUgwfUUqCYKlAAMke
	GzF9J9J5I1Viozn/D+qOUhrUB8i15eV7DeeA6E3rZlHlFyByyBl9d6/haqcrypqgAQ/QC/bkxls
	BorO0kNiBfrWMqewU2t3CWS/SN0FWvuhK6sE7kqlN1ZNLIB7HP17XbI6yvJxIwsChDPzmbeDef3
	7TljLoT2QBn5eswo5O2HrbDUdHYiSw1SprPh7gigKFSMo4p2fZmNd6PTWXBsJN55SGNvse8lodN
	87W+/Hq/iq5MhGp4ZZ6RDG7i/OS+297+E226bw0tt0pHtCQgd0WT4jo/qa8l6IokT3XyVd/SDZb
	t2mCJarJFpfaV7/FSunsq0JxD2av9syXH6XuaXinSyHP/Pt+QD6HzoQOPcf2ZuqG40RQq/4Zc9x
	Fg==
X-Received: by 2002:a05:600c:a108:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-49036039969mr21695725e9.10.1779354230309;
        Thu, 21 May 2026 02:03:50 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 11:03:45 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v3-1-621843807def@toradex.com>
References: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0


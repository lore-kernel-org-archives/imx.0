Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428631;
	b=ar3loP0dyviuWar3r+y858NkpnfpCXPnopJ4R6IPuuIhMD0gWXx0IUOxhsBLo0hiN1Un
	 pOXv8Ft2Qw4WMSe7VAYQ9FXj+x8iOumKsqCnolepLYxPnzAzDTzRmb27srxbYymyJNl8O
	 ZjrWgXOWKs/TuQ6XYr7Eoq05Il3nMYH/qDIXO/+VqAXdnY30LRbWFkxP2ASYaudQ9fqT9
	 RyJfheqZjrEN20aa1pmfMJ68XEf8cMdB/Jnfs1HBs51D9bxv0VLG+nKu2rfLL49jQh2aJ
	 SdrdTeHZI+bFgYw8oMltjVpYyVYqD3NKX7x/HPSxvzcUy78aQ8phLPDeCfdMs1A3K2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
	b=0Bm2MpFQXhwgYDE9SBR+DCi/JMSwYSbAPnArzQZCbL27Z3zSJE012Ni3IXPjCmS3Xi41
	 /oKy9djhn4f/1+92bQ02YQjVmjWvWYYHs+NIiYfZpqFh2scMu9IoZ13TywIZTm+Fj3IpT
	 RlCnVvF2XYW23dF3UZUpIjiWCLWmwr3WIua71rKvez3fpzo3BOVcFopy/L5AawZFoRn5+
	 OaqR3dDNwzy6Vg98w7j3ah2T3Ai9y0Lp0OmEoI61nazJy4n4rHGfkJg9EMvmaUZdCzt2Y
	 RsWXlSquS95XMM87WvBoAPdmFUVc5Ipog625zq4kjiBJW8j75Z0MQlU64PAreu61rug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYgKPHb5;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC5606A336
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 20:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BC5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYgKPHb5
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso2517754f8f.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428630; x=1795033430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=UYgKPHb5maNIHVt52DwnwqIpPgBuPD8cIllIwYdm3LS+ujpra13lGNFKuA97n6pZcv
         +pBrdvIPuB9PNFygeEZebyfVnXhkM2BY7KrrSMM8YwL7ZSdboFO+IJz+EfhaQQ6zHhoX
         72J/YaMV4yj6HtgekLuCnI+Wjma/lYwdElS94aT6ZtIh1SDGmi+IhI5fhv+VHHcT2FoY
         j6LjUmdwNEaO5lgrGON3Wj+nYo+ZRnEWFpypiEqMCvgnnMI8ffilo/E2Yb7mbFq6s/93
         FdYEiI/0ld158TSxrDBdG56QyORh6KXmAHWhId26R0aK4m2kd/mMZNyNAXkGSbmBp1v2
         aeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428630; x=1795033430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=zldmDBdX8B2oA0Y7VSWhc0SD/VAVEKW22zU1j7TiHdv5f6Uf0suE/o1opIFuRULo2m
         mqb3xtz2SJgn9UzTfsukPqH0TSMdUZXiUENcpPV0jZclS1VY2E0JC5YR1mgC4VjQP6rp
         qw162fpH5h9JYlMUfPLtP+6DWpyuE1IAtjegwL2W7EFaJ0KIsNlhvxKR7zXCJNgRklwr
         FUVlUh426wia2bhRr5Rxu+6d1Cg2EOFVDzWvT0vEADeYhbJNpMwnT8dbwRBJA4zjg/r0
         gkLvUldSyjyPamZwzLeqUg8O/REOHDztmNKqqI0V8KJPOMzxU/iaFoW96BDRz39dk4Du
         I2ew==
X-Forwarded-Encrypted: i=1; AL+hErGqsbtp/5rNLienQIHfantkxFXup4Gn2wY2SJxUOt8kPUEKCR5TtgAHdZ2mlxDDDfgd55Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z+7hFyjiyHgBKH1Oao3LUL0VX2GD/yEZ+Gv/Sb7F2hKwL00HNH0
	791g7FLgEwLLTATiCHzSDKwTugvMEnd4Ht0lCtfVYx1wUeNu2qSqFbl9
X-Gm-Gg: AYBFou0znj1CcRuRb7GaSSOl9NOhbLNL/aC73DXOrvXvE/xLfLVLJjnlckUmGObHcWS
	mV/XiTcZ5gRJ4f7UvjVaqWwLzeV90GSZm52ynyKKoO/ORq303hFKRM+KWU/uG5h+6zy76ts6ib5
	c68psUYrBWYBpomoyjEAXsYQwN3lji4p2MhX8VxHBRrCg2jgxJQNd+YuVaaWcwccS7zIgCLvJlj
	NgLOoA5KS8ECnxm9deo65aTuSdN8lFBHx6ZrpBtqH2PgVB9kJ47bHlOZNNAdw8fJo2Nv60DbQxk
	boInnFh9jpFse1xaUGKE7Xp6c+fO6tid/56BxiMUPYACOUoY6KXJW0NOPYaEka0BANyDT04toR1
	xPm+mjqrrqA+05Y8v9JC58gTVUp1raCUhx1leAB32fL3FtgZiTSf2WP7rMHaxAFrg0xddAYNOeD
	7GX8CtSQOkK7+Q0H0neWGtq0P+WGF3O4/1zV+88V93SmfnviulUC32VESsOFPQjq5EmHwrGNpxs
	5dEIQ3llnJe0lsbJQCKEdb1me2YpwBoK8OWQLEgO6ZPDbHSzzZCr4jBPsxMK+6WaJfqRrY4gLQ0
	qLGOf14jTmjT1POOQOVVmoREeNIJ3bBbnC5VMG3KO2qinoMdZHVQeb4TUI3+o0PsxknjXxn19Z0
	B+5utdWVNxXgPUzmLYH87RLKZgwxpLg7/VQMxW67mk3+N3ZnhD8ZbpJc=
X-Received: by 2002:a05:6000:40e1:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-499c64fd304mr6044596f8f.24.1794428629757;
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Wed, 11 Nov 2026 21:23:10 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - No changes.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


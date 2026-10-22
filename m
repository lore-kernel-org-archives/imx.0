Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673496;
	b=Lrl/lxBGxK+ybRvErcGzKh4uvJIMS6oTugmP5a1QlS2Rf59PQQyqPBmjN0CW5Hb7UQsm
	 sNQpqWZC2YQpXhRFSrNw9bXsaP4+2tYOuwVR9kkil3cu0qI9bBE8Omy5x/TMeMGx6yQCi
	 nJzeyc7jXed3UbqpYjbhj1pV1Qw2daDmbLqg+b3jiVHe/Krxwc5QskvCnvbOE4h/m5Vt/
	 YY2RDBBMqSwoY78aVSPMDylVyWBEbQCcizivgFqcHG5YU7PoCbbbRv/YkmEo859st5eiR
	 rRp0PoKhyXOaCqizE1gPek+kiGT2JLOJZ+szCt92tuBqMLOeDDcOmhWmUsVpfe2tJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
	b=s6UdAx2sXML5jEG+DYnN9iYy1mHW8AWNBJQiu6z+IbmYbthj3d+YnmTVl+CcCyZqh0R1
	 SsIc06HjAEVrtLqICvnswW5vAx9usV73SYPQiALZzBOoC7zo2tn9Ew0flEsVIxIQQFH3l
	 0TOzuoKEsJlDM9rpuwkeKK5bETCKrI/5MJcGpkr/qu4Xy9yA6O+IilxWUwJ9bwCPPyHz9
	 H8CtaPw301v00slFYZHtHZPg6l6Gat7xefNYJputGMB0qOKd7TT1n0bkgMsoKylfs19je
	 bJeJj+O39ViFj9DK+xwefQTZpeJfwYurlAqR9JaDnkDS45kyvRRUL09q7O0yT5FSREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hQ9uLPLH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A65606A333
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A65606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hQ9uLPLH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3783085e9.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673492; x=1793278292; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=hQ9uLPLHM1y0/VFnINT5U1BU46Mj0AS8PG4ZmUNgHuXZuvwc0YrtZGy5TMIm7SpJhV
         cESHmEwmVqjtyzCgNvVHItlxloL/tJlalkV+waN19XwU7+l02bcuChJ/6sPr/MBZXj7j
         4a7V6WF9dB87ZuToGFxKgkoxuWMqtv7rNVz8LwLodzUlkLmUApQGhaJpkG7YFu/633Go
         1CVhQl+cTSQyAiLV/88TlBbKb4UOU3dXyVtje4rzxVPYLlsrfid+0k7Sydd1lWpNEywY
         vucy27f6MogilSiO9nYF9Qco6V+n8ZvTBfjtgBljtkvBwFPi79+wZ0KwZXVrqBRnUiN0
         9ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673492; x=1793278292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=tpKVwwoVOO0brR8FIloygpNdQQ9oGhlZIJmRfbF+N+vIPJ09OSQB/kGo+D9cG8yQwp
         bV9YGb+zXEPqb4hd9F4BVe4PGesnm/jndaBuA52YNxzAxNlyaHY0I9hNM9j5GlFd8BYZ
         cfoc+OWplevfXfMdm5HV5KHcY/G91jE2AVyeHT/gKLPmjao+pN6SSb1BxuwMS7wqJSz+
         fLWuVpSXFC9s2AwNF1LQW4kYD0iHKAZN53Yq+JxWvLYwrGFgJgqQ3ZEQ8L6C2Qwk4X8R
         mx37FrOOqMmtt5sreij4WRu79Fit5EfGHvSFT67r1QYHxK9Ml7AV4Xem02jVeRWpHpQ9
         1AYw==
X-Gm-Message-State: AFq9FYL0JsQ0siR91uurPQ1g3GNLDpG6YzQTKLfocLMisQP4a6il76Ov
	Q5ZT7kzgaLKsJPLcovy5NZsynQv8deDwW0dEcKvD1qHQgGmMSzSF7jXw
X-Gm-Gg: AYBFou3R2NMCwZGVm15zZFsyNxy2afERDXiNrqlR8lYRj1LoNyN6159eVgZFYyb3M+9
	7TEkdO/lMH5VvX/8siqqwp6twBz3FbXwMZcEC1JpNgP/VlPV13ikw4Kz1jejW3TKwFq/tVIlZQf
	cHWTosrOtwhiX3rxcyCR3CtUpYAg6fuVM8PrZv35MT1rBf+9ExQ12UgQjXQZkGDWq1ujBz3LJrV
	lNCauJSQGSyyo6cwpN9xKE5TacGerQQxZZ/oHSzEShonwBiRFjO7Jq/q5f2ejZJR90NKHC+eiyp
	UznLaotMtCqgW6fIxu3zyBpQfRenOPm2pap2Xj8vqcI+E9sVEE47dviGnB2Mk+hedMwa/lgW5KS
	vCrXPMwmyjabqnKIFVTvpPLOr4fvBNAbCDXyow1LDh9bMxC0XVOYefsTNkIagX6B9F4zyzN8Okr
	9k/+944X66M9sfvEsTInAH3hZMwgT0dciMhWu/x+66r1JgfseZpURjwSvVIV6smntH72aE320/Q
	g+cNlmc7oQfpQhHD71v+df06O/KI54f8bjsZF+n6BWqXxyhD6LI+oaMOsmiRlOGY5qGjP6PvmoC
	YU6xquJadyAA2YGDvJ6oDU0pC/vwC/q7wWIEgvD7Oh7s+31lmr0R5As=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121580035e9.26.1792673491651;
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:07 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 is labelled nau8822_1a,
like on the Verdin Development Board, and can use the same Bridge Tied
Load (BTL) overlay.

Combine the overlay with the Apalis iMX8QM V1.1 on Evaluation Board
V1.2 device tree to provide a ready-to-use DTB, and mention the board in
the overlay description. The overlay supports both Apalis iMX8QM and
iMX8QP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 3 +++
 arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3821e3f16210..0b8f497c5c6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -810,12 +810,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
 imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
index e4b662519a6b..cdbe7bb1ba90 100644
--- a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
@@ -2,8 +2,9 @@
 /*
  * Copyright (c) Toradex
  *
- * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
- * combining the two loudspeaker outputs for higher output power.
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board
+ * and the Apalis Evaluation Board V1.2, combining the two loudspeaker outputs
+ * for higher output power.
  */
 
 /dts-v1/;

-- 
2.43.0


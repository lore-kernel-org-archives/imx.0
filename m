Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574512;
	b=5blLgU5IOxJeKgcmmb24T0l7B3dCiW2TwFta0p/fVro0BvcKiY28ERF2qCura1RIVkzv
	 Roa9LfKh/PVjDONnFv9pLkFZ+/SvDC/SPfUadhHJIFqbVT+NRkUw4FAIgdEZGnaIUc54E
	 6MymMOoQUIAcD9cmmL4S9rRhrVcoynzv/KrBFV74GtE2g4js+MKkrsYNNj9HY4wO0IZGX
	 SUc6huOqJHcQHBuq2hDJQ7VKzrpP3Iyd6JO5kfLaQ3izm1J1iPwJiXr8e9UnEURhfCZ7e
	 Ht0W93wzageMCxfHXUTaj/jsDXc6qItRGW0leVMYaptnh50Os58LNpeOG7tlikXzRbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=AlZuzMRhgLEpkaiYzuWXoyqU1xGSAZ/lge2lmjuQKFgQaM8PlztpK5HywwKmDO1c3xc+
	 H+ezdTAM/1TcobVUZiP+DbxwXpSvXLmgH2O5ysQxj9uHtgSngxw9TG2m5LBE9Tgq5NYiC
	 Kv7vO47iHCu2jCqRiJR9NNfThTGi3AFvVYgXCdgpRk7ia/9jeh6I+jYBb4WmUmlXJk7oI
	 7LP0LoXxwhld5gWBUrXCkQzNc8k6ekhN+QK7v6f9TG2cqDzEQkZWsXh5tYgvMSQ432ioC
	 qN8j9CQ7Lhc9eMyeobRAt/WCDHFLjgvdyUH4Z5eJbKbOPo/qvlQCk5iwtp9TEG9XYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=mH8FYWnG;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548D606A32F
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A548D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=mH8FYWnG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5459725e9.0
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574510; x=1793179310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=mH8FYWnGHz4XxhMWzvDToIc6ua/DA1E5yLQthHMt31NmFcn5Xqwr5rrK+c7QEqduEP
         NP6IEC85PSeoGblnUHCI9CX1wOnhMeq4rQbd+2PrGCHDGOKcEOXHy7s+j+8u0IWtijtB
         IVSlBOVkTC48+qhBWBiU3jlXdFAenKGI4BtF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574510; x=1793179310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=gFCJYrKi1XkPZvt8Fs3tYgtaEtG7ARhRwxFfxMY+8l0/0Hligeznmf8OTc9BTdFIw0
         1YxORM0K0AuWPCf9yXyAQrbyKg4Me3vnG6mILrB3rqfuslrD/Ivtc5FRWUvipNXjzSCs
         oxHiFWxI0CT6i5IhscQyvqw11QaaxA9E+b+lm5FedUe9el/baXNKr00EM4e8ujOkKH9g
         RcGMvGYWMEYfR+oHReWT09GT68yokUZaQ8pdSmqjGvbrAw8h4rjlj8dshJlSawDQ1bHV
         llMAkg+Ip/oPChNKcSNTlNCMxRqPacN0rIvUBjZyTIcA7tmx2qamfwNuXeeuhwD1Zqh3
         x6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwAyi3VKbVK2Wv68U83hDEOcIhniHH0zWYtVbef9pu8v+EbdeQZHvAUFxz/+kVVPmdLVok=@lists.linux.dev
X-Gm-Message-State: AFq9FYIrnilB36ldy8ILiCbiVTDd31pHOG9wemI/eV0JIRut7aXQfGCq
	y3nZ5neCaqXm+Fdz7wrCO0o3cWJ7JgmZlEVQChqKJr2QK68n0rTvZDwQ4fsoI0T1AZg=
X-Gm-Gg: AYBFou2DPAruOKi7EZHeIgIPUgW6lVfWUkd0y+9h0MrDe8kS71UZvD+OwzBNB2GTuT8
	F+aHTlVEt9hPTUCh6PDYE10wUnxHMCuhb2B9xtiG6mb2D23cm265gHqX8dLsz2RSrqueQwj6hwz
	K+qxEbHLaINu5jxygtdAl74l9FCEhK0zs9lj/LXFQ34Yi8+I0eVv/rtrwVmYMXbmmVk/XculiuE
	+PQiJFk+asLua4TE8WHguXYcO8CrtoScq3tjgpKthTYqABr8Nrf9BRRM77rqZ4n7XeO5/jpPLOy
	/exTGjcgYZsn/q8NpZGjfg4cYdoJlKoTVvq9it9k/Fv+EDPXOJnqvODeX0CdA5qwLYQLIowyJkx
	ZQ4awCdmzxlR3dgKFcdCVM9FrOWk0FVZii9vSrhtrKrJaggrSiLWuTPHTPBt6DKwE5567JzfY7f
	ieC+DrCYH9CJkX5ORL1UjDYYDbZ8RadURhxaNXc/1bMNBZOkKwqb0CW3Kn9Io4iJ/uxkdjOeXPA
	pDd/tHFamqoxrgClg7zrzeJD2iNnGZeeqTygAbcq/XmvDtvF6KuAcBVT7ynedwaM+aloPpSEwTm
	ZqnLNjqiNLdI4aa2Bg==
X-Received: by 2002:a05:600c:540f:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1fd8cb92cmr29337195e9.2.1792574509972;
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 21 Oct 2026 12:21:37 +0300
Message-ID: <20261021092140.4142493-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3


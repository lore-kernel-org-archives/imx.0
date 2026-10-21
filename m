Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574510;
	b=3VgcyTJfRF4MVIVM9n1P9GLMwUEIk57pbNrPUjOWEnjMLpENTMcMjsCZSdZjfhc5k9Q+
	 FylrePJpsQ3pQLlbXKlRZp0Io8DN8qh6IlPW4nReRUKgjGjODCbzVWWcK4/aeo9UXPyQc
	 wTkiIIvBUhB86ob0nYC6gdv6gZ6cuRqNi04CM5KeXiNn4cz3R9MX+pVr3R0wCCq1do67Z
	 tJQZaL0klpo9i8PBCLT9ec8llsSGVh8ZqDIV9SdFeQxvG3pb5RfiRUREx2UbvRALMvat2
	 +ZOYFlwvj2GRH3G9WsQRo0MddvSnRfo2BUVrdJASG5Z5p0fdKdd8pofOfL6jofP75Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
	b=LQPe9GIbayiv0ghPLK3jsPIX4fpRUjFlr9EymPUrYh/yPDJDnnNYxuZLqLI9L4Fep5yg
	 ZSwjJA1lDgN0HTAo5EbcLqrVP4rS2RdDP8rZbjgaUBQ1ssWPG/8sOJCj4KfHWABRPgfKe
	 DEsqLJ3T/3h1b2GFY8Smuy+j7pTrsC9NYv0GJeYL15PcmmTMoGjJkm/JwWaLA1IIc2a7n
	 F6lgYgDTySAsy7YVNBVfeMNgqAsklII+3kZCNg7zSko88XikD+3/FnVFxFrCywW5MQsVL
	 7qxcrKXTASNnLYz3iZ3+Az9g+20Vs2kAUs4q/TTJDsX2XX+LSsLjOewIov+XC4+e7XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=QAVf6Jq3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C68D606A31D
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C68D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=QAVf6Jq3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso4227455e9.2
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574509; x=1793179309; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=QAVf6Jq3UXUBWQabJCs4atMMsyPvIevnme/A5xYL0fwIB0y9GqTPntxwTRyMV2c9ar
         ZP/47D6NLJ5PzE3JCbiD0yLZ1wJYSJAPByGYQkwfu5IY5X3mh30wXTFUtkTCSaY1NBaU
         k6vjIH9PGgjDTskaFQxcSeGxiVg9E7L5f+TMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574509; x=1793179309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=ZMJdUU2b23s+cazj2KJ1UF9lfeVR/XOr5LmnC4hXxiwrNhq3LdIB+Uj8+lLatYvLgf
         mgNKS5bAma9U3YWMkfjaYXocHz9MOhmKVFp+8XMcAWgXo7S6jpI58caG6Om5q3RCrB8O
         K8BsbLab7q7qWKMDhYLsPtkboqOKYOW85GZycyZ5SIZXEnyb8pMEX6rbYe/i+Balw8j6
         TXizinpYHqjpdrtuDJIuWqkqXGf39RBM2r0hRs+aOf2Duz411ZM8TM6Z9Dg1ChAH/7xY
         DLHgyLi5wFMdTH0cNFdBwVoa9ncJBhDx+vk8DfTRMwcoOWwsnRjF9eOmly+hbamV0ANS
         +9uQ==
X-Forwarded-Encrypted: i=1; AKwUvByv374i+9rsxjup49e52bb6gV1fQ3FVlkHQYdaYSpmY0amwyLiRj5Xq0DTlvRwHd6cfiDI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKgGI/wG6Hc2Si4eKomW59kx7jEI7TQQdlQxRzPmhhx34i4rSba
	87FeDi7ZjRYnJhPfR2m9qMzLGEP2hEIpAyd8J3NWunuGBVCgMpcojf7emmpGUSJ7o9Q=
X-Gm-Gg: AYBFou2s58WTk/9xZ6K5NPNYGai9jY4si7kb1BrHTxJ/PbWH/UaWSVJBLwDMbTA6JFj
	YD6bZryVBIzzqgIusjAeORor9tFYfoijn8jdUd4P/fKQlevHm3Pp7g7HmN7R4CtK/rj5ekCCfHg
	RLhBNQS5kTuzLuNu5ukLNktlHYk7DYsUJBkUNKzRLChaWi9nuhFWfAVROtguq/aJNfTcMx4jax5
	5hIh2RdeYPfEw64i4y5UQdfFaeEdK7HGcdtEvSZmmbfad1b8twp0P3S11phiopj8LYV4iLwbV8W
	ZZYVm534lFvj9sqp4bxkfMosr00QZOC+ZulGeO8j4Vey7zWvg2pjp2zR4DNS7l0Bci/GlEzxRnW
	OhOgzG3b5/beoXUZx4t6fBAjCMfkUIDpTPpkm1uWgt+9xzi1Wg/jxPemy0v4QtvhXU6eUoeP2SJ
	E1FUvlIx0Fl0qrlXfjBFjYe9VCUjzIdhN+6+xdFvdwAKUA1wRWXXs0s3YcxYGdboGsgkTXWmqpH
	hJDwJc8lTHdNgViWEGDWbxeWXsZojOvP5b8AYGZJu9yyxOHbSyFOQpjSGipiUEPzsDKye5pypZg
	P4gju2xO7SWTTydQDA==
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr28979085e9.21.1792574506584;
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
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
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 21 Oct 2026 12:21:36 +0300
Message-ID: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v3:

  - used LLM to cleanup most of the errors and warnings;

  - proper use of dt-schema this time around;

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555174;
	b=dRHHHJOfRSC4+v6Y5bG8mcSQiFaOYQnvQ6tEYxdsUQl2HdUriqMSnXeEUG1h1s2tgmKz
	 Uwx/CTfU9D8nIs/te4wh/VZ31OczaDmltim4pQ5H527ms/u8v65M6U7IKyIBoEC7hYUjz
	 Y2kxTnez9x28EEGVCxVGS095oCgDxQsHCAVPLnvePoCDZtidY6kBl8+ibsxrg2yuK9wXi
	 SOtVDkpqrEk5fPN64hhC8W338tw7jDnpktKwKqnltQlLNUeM40Sj0K2tXqoHjqum15EEa
	 V0NlS012qtziUJiOcCCcnB7bklpJ9WhYMdbTXrNPCoSxo+TMob5km+m9wcFn52U6UVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
	b=YY9KNTN11Dmv6OQdeNWdWFKEcKZE7fBUuFFisaU0Xz2Y6nY3+25qaLvymGfvum+h53Tp
	 EnYEuc8XVh/K6AAdFPIT9PnYhDTuiKw6MjIx9Dd6YdN8zpSbictTOaUP+A8FX6fjDhhqJ
	 de9EAIyiROykABD1RC8tJ6mPUtFLH0Ro8xuQuE8j+uOdp7WsVmWWueM0cWU8d08gOBaEx
	 VUozsx4RKfPzn55Nba0KKD06bkcU+CScnZ4d/vBGc9G8gOoyZamRBelYnpTA0bNtvPcZ/
	 GuzByaSJI3yGOsFoxaa3gI2YzaEQ92PCkMWsLKLk8dZtgco6HN5qV7gXzWvwUa/77Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYSRQOHv;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A373606A327
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A373606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYSRQOHv
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4918c2d727fso238404f8f.3
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555172; x=1795159972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=HYSRQOHvEbxhatEDTpks0bPHYJJTH6AdfZVMncK8vo6P5pVnxcZ3sD14kA+Gb9CIH5
         7qnENJdau/zY/WaDaDanSQyl9LeJpjMfpB1zHZ3rdO56AjVApIyu2GI7KlL2uz8vNiir
         jJrSqm1o9vA4e0hHwFfjSaGd2ruuf3WmduLKZnz7bs3nJTjbEG2tcnFa5boZ4QzbJA8F
         6ymH9e1xEI93C1ZY7J/KKAp5lua/uqsdIusawOZPZ6A8A/Z6M/bxuXOoWfO6e3VOlVhx
         SwkIcx2IXaPnNHvbDoJzl0q0T5jcMnu0hNtRROQpgjeVUJoHjKwpkm3jng88eWu6udLN
         qY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555172; x=1795159972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=ZkF3gDbIouISOqz7bDdwtMAYtr/PclbfmqHUW1W2KTolP8VAKP1HPuIfyZZ6Nv0vpu
         NxWCNrv2Tja1SpVZdfkaEGPHB685fPj4zYqH+L6xE5UReXVd6aOrmkxf/lMi+YRkIzMz
         /dnkyRsU3Siu5hyIS7pcjMPKv5T9WyLNmG/sFY9nQHYmIidlTRxacsKcSW8IfOESfSyn
         QINDPPy0NCy8SljCeRbBQrkGuZgnPeHShO6BhH7xrNTekpPi+dp3JqmE28Ign+slHW7I
         DIuPxuFyaKgh5jl1AM96nA3c+zkPYCukpwx3CMfDcknPXfcX8yFJhtuBjrPH/b7kDO0A
         HyPw==
X-Forwarded-Encrypted: i=1; AL+hErH/5DsfdkoQWiZVW4JoHn4TFm8dMYKQFUYO20P5FmEa31sRca3e5DftIOU3G6RTGCfT8qk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9lBtqIIRmfmjeUjCAk/rAKI2o9za+5H43KdiDi2tqOzrelzFp8
	aUO+Tc/fJkL9fnWna+NSj2noZua2IhBdCnJdGV62ZozfNaZ2MbLj4UiN
X-Gm-Gg: AYBFou0doRdtOAM8pXU2om/iQ3XNK/WWK75ctZP1mbie36LsU8NZQ8zOIsSalUMdFx6
	Rz6OfuafFPrMjH/1KjrjgXx4yO0kHmaSPK0Hcwu+YX+IG03cnU3p6eQNO/RrbXftcYfaZ+zm/tI
	Lg73ubt73Zs9kp99WDeBjnf3KtGGGkKOBgXGh6sdACbtgy42K8+tv3TMX4FeyF6G2EQ0g3nCP+U
	lnGqeJsA77mFvlqlMMEtrCpZl+NQgFP1P5Kz0KyBxkHww+9pNNKm8CZ5hXsEBfnluRHX1/ulTt8
	/3uopNkaK53F/fzEVW8tbjzvpQaLXm60klhGnX1Lj7DxuLHBuxZ34Z2AOH2ST8OOYEsPyhUvG89
	DHQBgh9qFkuFF+30zR81IhLS7EhUv2o4mzDe5YzBHewucAzT7hLgKlIbeLEdHdy8pVPnSk92Yhr
	iujoST2zPdVu+8e8lsmhNC4AOackqJPnSYUMldNuSm27PMJWQ1Z5+gCE1gHhClT2kkQ6FC0Yvp2
	8pKoa9YFoB3HHg+/O53vYXE753yLVO4Z6VRhogyYd9oRp0O3Qge68d5gnJ3UOMvdaxjK9wZqXFl
	d+ObNf7k0/Ypd5oLjJM8kAXnCwRgtO1g31s=
X-Received: by 2002:a05:6000:240b:b0:490:39ba:4359 with SMTP id ffacd0b85a97d-49c714a2db3mr3596058f8f.23.1794555172357;
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 08:32:48 +0100
Message-ID: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1), and it blocks
for DMA_TIMEOUT before it fails with -ETIMEDOUT instead of -ENXIO
(patch 2). Patch 2 needs patch 1.

Tested on a Colibri VF50 (i2c0 at 100 kHz, DMA) with v6.12.117, where
the touched code is the same; on this base compile tested only (W=1,
sparse). 200 rounds of failed write, 32 byte read and acknowledged
18 byte write: 200 times ENXIO at once, no wrong read, every write
acknowledged.

Mehmet Fide (2):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


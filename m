Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5026B182D0
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688769; cv=none; b=hNpcBL3Z7hGKK2ez5WKTGc5dDhneyatdaeAK3lLkMNbe+NKDP3dboqiHO/tXpA3OFmG+FXDYX8Cs2EN/tVVfL61wXupI55kkxGsfC1A+AGEkOzaF4PkfkPj/bBCWP/ziVreLyAcijujofLsvvYj2lcvGdHNFP52rsnSvrN27qhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688769; c=relaxed/simple;
	bh=gg86laQvQ7dopGnUWBvdIBXxp0diSYbmBjkezIxpKRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJZL0jLPFOsZPC/cpdCptC5+Ws+6iLPxNgiZyxSD8f50XjTzi6NztEt15fzjOwa4bqqbqc4qvnIf1nHmdCV9OCsm8SQbTxNInpi15wWi24DC+mNhL2ysVfq5F3qOrRwDbPvrb9JAdEjgwzEauwNdqa4p7mXj6twqe0VGHXW8jqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbNIVW6S; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbNIVW6S"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d094d1fd7cso52259485a.3
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688767; x=1750293567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=lbNIVW6S5WRlxYGCdJFgj6PQf2QvJwMazihKgWG5zYtoSofpRLXqUWN7/upmus2NOx
         F8N5BsuoYzK2sNw6p84X8nf1Xs8cfIUrRgVoTe6y3LXgKyTj7sAu/a1LDoR93LFDewIW
         +nxgNrI32EFV5ir3BpZ7Z/4Vq23YNhoNOqBe+Y+MHGMgnQQ9AH9aVVIGNbnUZkcWFINy
         RJafvVxppBestzY9Qu+yVJkJDHrobJdFbNZ8CjeaRkHpCxctioj3GT9yw+DruJHYR0xw
         9g1/HUUA62w+dwe/VAIBzklQOYxEa1e0r0Y4Efo1y/tsjeyGdD+Aq7qsWoCsKRnveljC
         24jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688767; x=1750293567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=ryfiMcUcg2r6UNdNmIGL820hYeNvwhebDMh3T1+L3yCyBw4/8rw9sQI+3Y4FEXBx9Z
         vCIg18q1c4jVZA5Citb3JmjVos1wgUPFpBClso5FHwoOpaWoJPgztFaZKicWElAg8G49
         p6uMDiVVgRcn6NtYlUkwZytbEK98qnHjWmU3NivcGyLsk7zKtWKbB7QqCiv9Xd2dHUpK
         6Ork9bnzLW1YMcV+OQEeQz9/qzUNgCjFWZrGafoznp6xAhHsFQlEnEhUn+pK0KYvR3C4
         k09fACexRZz07/66gTQxaeXVNERJxbglRTFqklhRDHKQLd9pU+KuOIHuJy2HPvBBgRn+
         JF9g==
X-Forwarded-Encrypted: i=1; AJvYcCUqUWuk/3uDq7NckhiUTxgW6qPd1CYDJypL0w7RlSCNwqCEQbmzJpNk4uMHnCMpoA24vlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPmPsK6dM7SfVekb1hqs+djx2+0VJmaovHF3rmvMWOafJkKhzv
	Y11F5RVu1eUtojPHqRIXYO08VhypS1S9+5DbjlwyzAv2nCxtkRGPt4/PSIF0wg==
X-Gm-Gg: ASbGncsSiPgD+QKOzMQXWltwPJIQ/0ygCSYXv2Lz9Frwh7PAM0T+x1mC+eW1Hasmxge
	EwM6vowYyNAw5osAI7Db8TMrX0gKExp4UfltLO1qMJhwZiHlP+BZivBD/BSMGMdhUG7EJl8XnFv
	ZjBHexpK4fTXJde1WLEPtaKMtI01DkW1CQiUepgOP/CyUWWaLnC969EX3opNnoAFJNAcok58ZN6
	4ITEClPvunno1tb17YgnE1uQHeJOQZwzo55BiQobQ30+erwbMFKayFKThvGIXXt7cF2Y87yXwpw
	W6xKdMbxFBKst+u2ie1mAcMnIKTx3HDZJLwndbZ7SfnfEeIZaOWFOXf81Uv3dGJZpjXh0NnEkE/
	flbWdfKDShc4YJQDUHX9zGLKqUA0tU/IgKxErrUCEE0d/4o8=
X-Google-Smtp-Source: AGHT+IGavGO8UOvSglJRlraCBSQ61kmbOdGvSpPmLRVt0vmZVnRVxF+/QqyPrkh4gyH41hL+GauK6A==
X-Received: by 2002:a05:620a:394d:b0:7d0:a0f2:e6b1 with SMTP id af79cd13be357-7d3b2a5946dmr238452185a.32.1749688767146;
        Wed, 11 Jun 2025 17:39:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:26 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/4] Increase i.MX8MP VPU
Date: Wed, 11 Jun 2025 19:39:18 -0500
Message-ID: <20250612003924.178251-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the VPU clocks are under rated, even for nominal ratings.
Fix the nominial VPU clocks and clock parents, then introduce
the overdrive clock rates.  The fluster scores don't change,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

V2:  The only change is 4/4.  Patches 1-3 are all unchanged.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 23 +++++++------------
 2 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.48.1


Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252E1C860B
	for <imx@lists.linux.dev>; Wed, 27 Aug 2025 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756266947; cv=none; b=DoYetEi9+EWR49azIFp4ARW9x4vw1skH2FEbLlzkxuboysfv95B0+aFK2adxrYdIJrNtUql8IDojZYtLozZuWjyEiOzpvsV40O5/5148yvgG3pJZ3K1UTUlyjg6N1Y6BRHiqALmasufbF6Icd9ScLljqeCNSJGYCNCWg5Ff0TY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756266947; c=relaxed/simple;
	bh=EeurWMOi1b1RMRIJVLCG9Ys3siI5bm4VnuY0nLvGKNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxw5qQLmj29nQkSnDWDK5Y+yanB39PfcO/DDp13Bt6NyTig0wCaCdA+p5Bz+ilfKGI5slAjVuZLniVRMmJsVuJBkq56BGydyT7MP7xx4WFi+wT83XPNHzkKOEHRI+bAusLL/zPj+ZBFUegdzYhajx3i3BfzeiudbPPK4ij70v+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck/Hgb2o; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck/Hgb2o"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b49cfd967b9so2054811a12.3
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756266945; x=1756871745; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=ck/Hgb2oFbUMqbTJ6YRRans5Sf0MAELvK74AsDVRV/VkLiSaJRSTAQhL1donlldnI8
         9PkBxhAJTdoHpaeT+NRqOrefpEAFZrJamEFEmAUNhCnnU8qucys1QfyJHYZL+BVgDgj2
         n2BR9Kz28x/1jADw1t8yOn0BbYVL8kn781L8gehO1jsvPzoWkgloYxq6Q3RVXVpcu7Vc
         Y1W3yD4YJBAwsaSMORNgo9z+hzOgohqLyCIxeT1cGzglTfJhJMqeGzxRh2sBKFllf2BL
         OakMfIJdoclWG34LW8XvJzYXb04UHmMIxRyu9pScTzJkue8fp/BaT+eCTc+LpZTlno8o
         r4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756266945; x=1756871745;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=wCYePlTrBB7ZRXstIuDYIa7iFuiqNqCphfBT6J783QxYIPI/FHzs/GWaYGeNTblVFf
         TEMGyBbik0jr+Vs8iGSkfwqESc71zAFnq9U8u1UqCZ35eQYa1tcC5918A/sOA0iZrjZJ
         ph2ZB1dRnVLktdO+45XHUjj7luFQ3B7ZXHjll+uDNH62g0h7uJ2i8q7Z/UWozI9X5yqC
         QeNph5aMzqtEjC8/ZHNpBLMuc07/DUG5h2RzCy2c/RPNDW+pmcJKo0QHfbNwGpaPxBGY
         9c3yTBU1L63/TvCXXIqM78b8fcfFBDr66wilIu8Qlzu3hsyraZIDbyuHmGZ8vXwc1SzQ
         9TAg==
X-Forwarded-Encrypted: i=1; AJvYcCWSfpGNCuFed8GetdqXSZVdoGqIDiFOcbYy8x19cWpAC+zVMmICXzVqJWUbwgAH0TfeXiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAdKHAWAFd2vtTpfEyB1VLfzIYI/TZQPlt0zBXtHfprUFaBEsc
	ggpIdc8vYtfgjlzsZPzJAW4Bwj2Aqj5LZNEQAyG/4GUyZfwZgGgcCCuQ
X-Gm-Gg: ASbGncsHQt6g2QOzYjth9DSCdaKEv6Dct3KjySnXm+/Mm0FXE3iwlbijOxfPcxiYjJf
	/E9tqMxNswRPtnD53Q1aV6oTYESB3oEbjy2rWElvCNlDbdhwNoOHTUQa9tE80/etrWKU9IsXUTP
	9PC8GQwxNG2lppD5xcLjdwxq7mMqI+MFK3L3FCEUmzL4ilPiGuB1Ns+f9VkInyjNw1aPKP69w08
	/gzUMkD3EMTARdIekCOG6KlXe1ul6vdno0P/MxMFScIKAWEJ13W6Vh5NxQr7PF61uALwczLRVPj
	16yojREtTIv+GE91FWLfUfl+Yb/P/g3DFCgw7KV7tC65oFYj4rtiNFl0cscw+1m9RuttJiPMbve
	oMiTuUeGaS7+Q9f+Qppr3FdfW6ce2JaFp068CcBcGiRA=
X-Google-Smtp-Source: AGHT+IHCKulS5BdqLp8mRSWpksw+q+splIe3zzH4/ipKfWgAt9xTzPA2rbkbMvF0CbSu69Kz/T0M0g==
X-Received: by 2002:a17:903:1207:b0:240:5549:708e with SMTP id d9443c01a7336-2462ef942bdmr209447475ad.46.1756266944779;
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Received: from dragon (23.106.129.234.16clouds.com. [23.106.129.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2489b6a7633sm4970755ad.85.2025.08.26.20.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:55:39 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.17
Message-ID: <aK6BuzIYwUBRU1GW@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17

for you to fetch changes up to 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:

  arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.17:

- Correct FlexCAN PHY settings on imx95-19x19-evk board (Haibo Chen)
- Add missing microSD slot supplies for DH electronics i.MX8M Plus
  boards (Marek Vasut)
- Fix assigned clocks for JPEG encoder node on i.MX95 (Marek Vasut)
- A couple of regulator setting fixes for imx8mp-tqma8mpql
  board (Markus Niebel)

----------------------------------------------------------------
Haibo Chen (1):
      arm64: dts: imx95-19x19-evk: correct the phy setting for flexcan1/2

Marek Vasut (3):
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx95: Fix JPEG encoder node assigned clock

Markus Niebel (2):
      arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
      arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V regulator

 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  1 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  1 +
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   | 13 ++++-----
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    | 13 ++++-----
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 31 +++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 10 +++----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  2 +-
 7 files changed, 44 insertions(+), 27 deletions(-)

Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B061531E3
	for <imx@lists.linux.dev>; Fri, 30 May 2025 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643446; cv=none; b=SnvBFjzTUK4wYOuZh8L9LMEAkXesu+ANgMb38IWgnqR/XQ5eRVsxtiQVah4jJoz/JBvQcVfEvXNqunDb5R3OcA52AN4KrrqIA1U4tu7t5j7BQEgs2bjoVBFAWu5xy8CnTb6JgJZYfE2uh16VBgkM4bdCsnsyNYerMlVTGy+oqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643446; c=relaxed/simple;
	bh=GmwDqseqzIm7MqhZ3/gzJXHApPchMAUBELR9XKOYZJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+NQHOAJ1gsbgtkvjxe1XxufI7NBk+raLkZycINcufVtLculj+1AZdgJeRsXPqM4lpQtReXp89WSYA6cZ6vyarmUhuUzXJfAKeOvMSJBXB1d0hfBJzMGU7gt88lkPf2gN4rIyNjKl53WvdWiwNzaajJ+Zz0WDEc3wiJ8vtLlI7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c58naUv0; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c58naUv0"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6facacf521eso20626906d6.3
        for <imx@lists.linux.dev>; Fri, 30 May 2025 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643442; x=1749248242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=c58naUv0ynQlC7/ewuyi4E/h7fRm9KRZRhnGmUiqCce1RZ/nr00KI8AhhqyW+yVRGy
         UozWaQ2+X4JNc8knvlB1AACIogbKajHZcPA8M8sA4Jzm5aWj8GN5u7EjljaYLI9vtyI/
         61r0H9D94g0nd064/+uwJp9CwQNGWEXY8qPapDyPxN4D5XZOX3eCd5+AfSyN9XjMgQAX
         QdJdrqC/BrWi/1nna9Zb0uMA7qV59EBIG27XuCzrwpaHRF9QZXI6TZ8ORjen3+ZgeURS
         V4i3ybCG6/cOQiYssBP2ojxJj/4QNxEH9TE/sq+Ow+39BXWa3fR8t1wihEVjlEpj0lY/
         3tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643442; x=1749248242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=Jm/uqwUSxGkwBe5UJCW1g/UxQwH2ikwWzemaNQqIyG9RCnjnrq3u23fM2TlOAsba6t
         wznRXDlonmUBmtbO+QLMpJK3eQ1m63AaHEAr9ULBOhFGYCRWmwKXo2NXm4RUTtrSFzA8
         sgIJAmtgAS+CgTPUFKZu/jY8JxJP5rL+Wyzxyxhsm93k7lYhW0ui5bcfy0m8f4pjj4gg
         znutHg/Ai+2XdmvkdGjrXDCe3TrYph3vOJkfx9vXLrN9mbxaDl0GN4y+235zqYc5/sL7
         znsPCbXAZia1/HURkjhLyjqOFvgvRZOtiQmvyK9Ff2XTZx3Sg8pc715ZGr9xK1r5Hb/Z
         wj1w==
X-Forwarded-Encrypted: i=1; AJvYcCVQNisz1szWxnSNJ3y20rPZrRTJ641Qt8wh+MpHE6J2r2er3RvYN0QCYgELFQvgOzgfPAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjtPUNJk7iDt0cRwghgOPv4DPdCfmLSHegWjn7BeeqniZIWnWL
	DH6AUhuGl8uwqQUmz1IQIlkEDb49+lrCzXK63Uwh0t/5qnmpUqAXo1Ue
X-Gm-Gg: ASbGnctcy7H22g7QPu2xiuJ8AUPmFLPJbRkF+ktL6zEehtgnx3Sln8B0ey+oHmP5lso
	jbBFo5RzHtpFdkyf15mpsGh2eSXb8uW2Rg/CYtKHABVJsvXFYyC2ugKiaoYddjEijhMsAvg5sao
	/1o25I+mHjv0WMlzDtnnwmnTjZ5457wksWNso5FIuofAO1puwP+bvvyAaGGEDq5kDOkoqEeJio9
	SLSMbxXtpSDNKBHhj03Et2Lrp7TTH+9XqFwhP7LsnyymZWuzLtqf2nMCDVk9Ly5X2f23q4/3X+m
	3Mhz9HVsbWLvzQTJ2rhijq/8cBetDnKLzPA7QIXvuADF62fMwR8D4fDRRF1zXSTd6Bzqg1fqOYs
	E0OtZQGDWNGLOgKS3kL/vjnFi3Q==
X-Google-Smtp-Source: AGHT+IGfTe2JaWKrTjR3it8MKEgzScIlOWAy/yBQKV2n97iFtrmSF6lgii4Qq4047HuVxPTbgYBp2A==
X-Received: by 2002:ad4:5aa9:0:b0:6fa:c697:97b5 with SMTP id 6a1803df08f44-6facebe6d29mr76790656d6.20.1748643442404;
        Fri, 30 May 2025 15:17:22 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:21 -0700 (PDT)
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
Subject: [PATCH 0/4] Increase i.MX8MP VPU
Date: Fri, 30 May 2025 17:17:07 -0500
Message-ID: <20250530221713.54804-1-aford173@gmail.com>
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
the overdrive clock rates.  The fluster scores don't decrease,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 21 +++++++------------
 2 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.48.1


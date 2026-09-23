Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700914322EF
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186990; cv=none; b=PUmQDhDcUbgEdWXCIFwPD++N6t365vD5vDDsm7DptzxP+5bkfDhn6ZgDPr62ACexnBKNXqwP05pudZ/OUw5Z2vTkET7RpZkDMbuq6+q84/Vv6xpfT2YqC9TlOGYZosuEf/nHR9mR8vwp8+3ebxmghsbgcUscbw+uFT7ThHaALg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186990; c=relaxed/simple;
	bh=87xVPTYnLbGtVGXZNXZNbeQOUMm5Gg/lyakj7qjJXxg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BUqW/v4QmZ+KO56Y9i4ap/BeD8xW2epnQ2shcUJhejk4Ks5hy+q3G0p+5UBh3dhcpB0HkVNXCYD8KMcuV1Nnw7pN9LqrVTJi/2dGoOfYmupVu+LLc/iYyK1/fBYCg7DRs+/F+1bKXBhutzxMkO68U0stQT++3c4T17Sx2dnQ95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=rxn5ovZm; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="rxn5ovZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1790186978;
	bh=S/KaJ4uoOUinEh73MmdUTlZkerQq9iWPfc11MN39MGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rxn5ovZmGVvMe2FP1CUoEzEVPYzRHJ/XtcWumiSZslEYZ9PR9Cdc4lVqjVodCEsCR
	 jaej6rbDI+GQ4tTuj/XSrsF8Es6uCgXnh6XihFuAeiA6yIC+Fte5exu9MTI+J6SqCr
	 GBCVn5qJHAlSajCv8Om6KwVF6o6BpbGwAjwR4OUY=
Received: from LAPTOP-TKBJAGN4.localdomain ([2408:8256:2d02:1501:3c58:684b:8f28:d14e])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 25D9783F; Thu, 24 Sep 2026 02:09:29 +0800
X-QQ-mid: xmsmtpt1790186969timzp5gnx
Message-ID: <tencent_8D2E80A7E2ACFB8ADB2BDBBF14CA10C8A409@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnL4Rd1vVVKfORU2nclknIy3CX3LAvPdYYXt+64NubK7N8aPmtj44
	 QizFsQHmqJBLHpXZU2dtws320R0qNwmhK/66837ATAakV6w9Ssxl3caGYTi8hnzxvaAcRfFsAPv5
	 uV6DDnF8EijQ7/xx5cfrnc7AbjcWyrdDOqhp6tVLOyXb3oj9WJ98HIxopvIeA0N7yD/sLdnKgVOn
	 QnYz7q8F3B8TURCgDneMD8Tq5rc4iuBcRBH+cIyVWEQ/gx90EiR5jQM4AbIQbVSI1uqzYucuSTSN
	 wZOl0JjndXop5AszXIrTKWYgAQhpxvKFLOyqjs8F9j95+9Tyo8DNyrLx/1wPmpE0cW7E/F4a7DgF
	 tALuhuxgpeJI8CTMny9aG+Csp2aQNIaZ2iDIAJYzE/AJCM20g8bVkuU6t99Y99LtSW3e8Sl8D752
	 apaia1tUcGzWT8aPHeBst/uL8zRSPVwBiJXf8DqPIo6cFjaWjRxFhEWF0ptU57eWJpJv0qYNMOXp
	 hfQAHyG4Hr3wGWk4BNhkwgQGStjNalLdR/oJWlDhWvBRmB0U/IEr9Ah+gBdg61Y80sR6WfQjYhdw
	 BS4VAlXqwbpf8sT1Mf0XkskJRWHCLkNB1kt+ZP2Kki7m8AYnxrnMm6Qlyl/u5yAK8BRkSfWBQ+7C
	 liu1TsMxoNAsV2IkJaoWiJDAg3RLVYF6g1ETVzFzrNucxbCChfs7SXINg22bbRjKnOqMPm2oi4c3
	 i6FO8KpIjShIxuhcGg/5II5X6kXr5bjYX2qS39D9JTM+vVacxU62uW2dgIWX8dq6pMZcmsANbNZH
	 FfFrFOE5oaJ5YBpJEzWyfTr/Vfpx4cizRBDB+GLPcQG6ovod5qlloCnwBed2ekPzJHiu4PBEkkh5
	 x6bn6Yl4UG+mKnaXxJHTpSL73uWZ52IWwc905nE6SyUOK1GG6xaO3bHJZKPoIOoRdY36R7RgaIGk
	 72lwHHK3tXQ3Z6gXM3MyvxOEtRGkw3QgAsEvaBPcOt2sO3zVOWycA/ZrxpgjidgjTkqpNS/UBCab
	 p34Eeosj+eIv+HBDBVkjb1pBHIz6e0Do1byJhVxY/6c5A45je3Cszv8E0FqDT1PShKCsFg26JFQ5
	 9q7XSa2zx28130roTJH0B6x695yd7p+R0r5btskDA3EUd+7XY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Haobin Jiang <lemonoutput@foxmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@oss.nxp.com>,
	dillon.minfei@gmail.com,
	Vincent Jardin <vjardin@free.fr>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Thu, 24 Sep 2026 02:09:26 +0800
X-OQ-MSGID: <20260923180926.3706-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com>
References: <tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A gentle keepalive on this v3. It applies on top of Vincent's
I2C_M_REV_DIR_ADDR / I2C_M_NOSTART series:

  https://lore.kernel.org/linux-i2c/20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr/

Should I wait for that series to land before doing anything further?
If so, I am happy to wait. And if there is any additional work you
would like me to do in the meantime, I would be glad to do it.

Best regards,
  Haobin


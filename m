Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158645;
	b=D9Y/7XY3C56Ilt+OKWKEFo80ustIE0xDXQW6WsrRB/cJgwgbr17MnxhrL1NRUE7Xj0t+
	 cw80hXOVlFdM40DCvggIABPyiMtozgSntU5pywfiZJxxhqVbCY9fFbYiQv+GH9N/bY5lq
	 P8uzjWWhI5B64LWD1X2ggHCx8a8t5ug0zBuCxaW0e0cGVoatccFsRn/roWAO8j11lXxMm
	 vbFtZ5MA43uuNjjvQoixOrLVJ2BNozCSgvGsFEqnRgL94UdTAdE/6kdu2L618FAtEb1Pu
	 cy2PYxRnJAFxl7pT800uZf54iZXpBlpGwZSQ5QgAQ8i0WJJSY0fWmwgbULwL60uFaUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158645;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yMXVt6q0yHMEQDmEW1Jo477hKUYUiAhwQxAj6RUn8ic=;
	b=QEOuZnVhxOsG0ty0/OWYR6IqUhDB26jMyCMZitRE+Esdz+TLamrOoSPWQD3NCOPhlAHB
	 Km96/r+c4Tor+gt9+gsXvLq3F97M9AHs2NHB4reHVgHSmcXSilfYaWlUu3PAGK4YE4yoN
	 XsSBENwV/VVh4r1HH8UPng3pOfJU+tU/cKtKhakd0TSVP2yXJwvuxek2Is4D1CO4pPNUi
	 4ZzqsiO1MzYTzORBOfHaRniBhKtJMuzY2C3AIISV3XWZlDI4W5vs4Axd33IUboDVth20H
	 E2y5l+yGjoWzZOuTZWdM8As5mNEC2NQGazn+Wa0GznD7yVN7w/CIwnbDjcFACMGwjdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=rIPrjtkA;
	arc=none smtp.remote-ip=203.205.221.210
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723B606A31C
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 17:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9723B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=rIPrjtkA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158640; bh=yMXVt6q0yHMEQDmEW1Jo477hKUYUiAhwQxAj6RUn8ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=rIPrjtkAF5dBDgSerUec+SqX6uuP/VPrzOi87PfcNfbe9UII1SfamGk/q0qu9aq5v
	 //nCHtDYg0OGMtJy8DgZFNKzMXbKJjlMs8rGjgjUckX1wxDz5W4cieEYWzh9nGgOuX
	 LoyHr+eJhtigsD4xckGbCaeyeuBtYeK82oTxrLIY=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158637tldxyld69
Message-ID: <tencent_2D9D38017F7FA92A25EAE78A562059747B09@qq.com>
X-QQ-XMAILINFO: NR2AmdDOCZJojQEiQurhnA2kAecAlc3NX7v9foT1F+whufHY4QoCxmv2e02cZ1
	 DV/wUKKLlsR+kYsKhhc26E4h563iyob6nix3lyDvIRKU0vfZrW0ayNNNKNw9IS7pEzqwgSwfgrup
	 0zrSV1iIMYVHCCTkjVeA6ol7REdEa3dHyZ2o2BAbPtSCP4Xsqm5C1Bi/bxhZDsxN6kzuioMALt52
	 zQFhNKvUFkOg8Mp5UO2pJR0fbz4QOSX0p0riOSiqqABAJ20qRvNxFlvmoonDMqdRkJf1VGgQfsvI
	 daMiU+kbzup7N0Z0I+npp00oAz3JQFVXdI+nnWWRJdY7MN1cZgC8LMhE34OJB7XE8WXrYA5FffKU
	 HhfahTx2Fhvf0IMpRXRL6kGxcw3E6T82rksv2y2Pxzc4SnhiwsuWvTUae/uv/s/+MZjgXg+Ag2CK
	 iQSsLqm56GHlYslflEwJh5qWLm/EssrCApWfn+WNUj2a0IMeAK89QkcuCMNnS72pVfdmnPc3SMEd
	 3tj2kVqSwXwFSCs7DQQi51dRAbNDkbs7dXrD/NavR3YZzvDF+9OxYq/Q5P1FXQE25TvYD/ICoK4E
	 qA+wpBxychcUKcZ5qGH3TdGd4t1lMVrtcmO6bFTZDzuL3GZq2QQUcGPDUuT1YykZhZZZ/K/i3yCY
	 T1Whd3LFWO+oqTVlLkwHleqhACUzXcLL5pHuqiV0bImyerEjgMJYiJ3tXVIjiNL3ilq9kb2QqPJ7
	 FDWY4vYqa4kjAJdPYCU3KPdJmOZByytfLg902fdBLxepBdvrsrdqEzXEEiIOaYEvLR1ptsXRs0rP
	 oD3CT0IEb5R+4WjaASgyGH4DWQ7Q8fMGybeJlI1PNo1IMCQH428n8IwzeSmutVRdrcvVr+WY7hn6
	 0PpXCrjg12QGtvdh66v8A0cRsUG9Jm7GtWDNlqJg3y55FgpE/gzKX6Nfno7UTIcyxhkJnst2Meza
	 bmXbo9Hc53hlgW0a8nVrnWbKweQmtfy6zeIJHP8p1cAcv4VA/vN6OulNRh/kKo4BqWtjwBgsPgRf
	 /NGCDOu7isZiUsXiVNCwa3LojivebHWiQEfaFJGlrU117zPLT7
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Jiawen Liu <1298662399@qq.com>
To: Bough Chen <haibo.chen@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] spi: nxp-fspi: check runtime PM get in cleanup
In-Reply-To: <DU2PR04MB8677C380950F84DE7EA6DC4290CA2@DU2PR04MB8677.eurprd04.prod.outlook.com>
References: <tencent_B3AF7EA2C812124397C0691BD0F0B7B87205@qq.com> <tencent_9A37C7A91DB0EF57A552A99EAC881CD24605@qq.com> <DU2PR04MB8677C380950F84DE7EA6DC4290CA2@DU2PR04MB8677.eurprd04.prod.outlook.com>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853266.5.9011991732901964059@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Haibo, Mark,

Thanks for the review, and sorry for the late follow-up. I also saw that
the v2 series did not apply.

The probe-failure runtime PM issue addressed by 1/3 is already covered by
commit 5d14285d60ba. I'll assess the remaining setup and cleanup changes
against the current tree separately.

For cleanup, I agree that the implicit asynchronous put from
PM_RUNTIME_ACQUIRE() is unsuitable for the ordering described by Haibo.
I'll check the failed-resume path and keep explicit control of the runtime
PM disable and put_noidle ordering in any revised fix.

Thanks,
Jiawen


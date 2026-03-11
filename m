Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A831F984
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266780; cv=none; b=ZzhQ9noo0vmIsdwFAYg9kI74A8rrMngKvmfcfXzLYpfg4Q8kkhcwpqG9qiHRhyhJ86LNIbmZNVWFoNYR+F3i8G3nTgRRAIFo8NzBFh89tgDpQNx4iUdoqjVo2ok7kod4mzOZpGLOH+XixcMwHa6Y/FetWwTjMJUrf7svQOrA2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266780; c=relaxed/simple;
	bh=3zNGKPTR7lMaqiJLXqiTCNcHkv2JKhS4tfMgYMU6dXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBYHLib8zCAALFdlKGamy5dGTflySjSvD6Mv1zTeLqzzuw+otApY+Mw0NTbiJ4KlucY2nJoEdc5D5/2mG3LNqj183uKz0wp86Iz4sou3LK1L22ViegHnpMyj8JPnAyuMVCHumP8/3Jpd2IYuoATypaSf/MeMSKObyekZ53ezDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TKH/wyx8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TKH/wyx8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B061C41590;
	Wed, 11 Mar 2026 22:06:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB94460004;
	Wed, 11 Mar 2026 22:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A0B510369BAF;
	Wed, 11 Mar 2026 23:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773266775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8I/cBM2paZR5qxCHtc+Yf5SzrN3xCWu16o5R1WNwpBY=;
	b=TKH/wyx89U42BCdv3OBj9m1984RIfhyFEZyTnpKB865t/x0waHjxfbWXsVRyDKCE1ovizp
	S2pKYlU82zJ2J0K+R3LjrOLe17W3B2HMWN8aN5iPCN0oDp9p+Wz2wuGW0SQYyH8GYY8gvm
	G95Zx62cpFGSXodgVLmQOkMyXgzpOZKyO8iZopYI50ntLxbxbT7yoRX4nfpNH7UkUJu8Wu
	UDr9Z2RfhlnlP7chbP5p4fJ4KETtMxGGvXlBRDEkcSKi5mjKVgq7iGvy5cGuSdTD3YYngI
	8m8U6VcsRuYjNYOKpvFwmuZGiCpMg7ToDwk6MAPw2sGMLP+A7fx6fwu718Ozzg==
Date: Wed, 11 Mar 2026 23:06:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
Message-ID: <177326636988.2391121.8519981227347109446.b4-ty@bootlin.com>
References: <20260216061755.2801697-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 15 Feb 2026 22:17:55 -0800, Randy Dunlap wrote:
> Correct spelling for 3 words as identified by codespell:
> 
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: spelling corrections
      https://git.kernel.org/i3c/c/5912baff068a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556926;
	b=V+fn1Eg7PsHL8JWVO5UYL0aOCJrn8xfy3pTPQQBji1wU9DrBTc7C65g0SLO5K4RqTlXY
	 nCJpNTBw0ZsXIf5jUblB44kXGF5T/3fhNE75KqSMuMAR0c5dwEOTwt8sx6Fnk77d6NXhO
	 fHAsWaaR00+r/ZcmwkYRwIzvhGD3Igu0kdI+YK0bWtEKSnPrvBqLIJlEF4OskREqcJJXg
	 jgvrXNfNEAQ46tBjEyMWpO0NC+cm8A1Gu9w9dmbnQvqo7ahBHNoTMgMjxcu3LVbyY6BZ+
	 pOK2HU5d6M7liYAFOnZeiet9EPhjkIj9loTR7b4NfQh4e+Bix43tyaBcPxRiWc4AGdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
	b=jmxUcbr+flzocyKH5AS6dQcBK+AMKMV3EGE9HyfWrzHuxaA54VyjM3XS+/31ETfwgyhn
	 Mycjsz8xNX1pgEFgwICpAHIqTPe5dibl9OeGMCO+FcIpvqKl6bmq5Mw/SQKJAPSE+0a5z
	 Q73ybVrLPx0Y3wjRPEvbmyJI8GcsZzM/qogGsnxsxDdKqJe81fuhIJYXJQKZApF6/brH7
	 OHerRzc/PCGTWX+E05EodntfNQemXjpccSkRoE1gVKtZ0qEoJhWinDtaNPQFughcS/aQw
	 vgGZ5uQNd3hWWQPXXC23Z9NR7m28WN0cZzv7e0CI847T8v1UXC6WJMpy4W3xha3Gfpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPCXw6z4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E111606A32D
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 08:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E111606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPCXw6z4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3095475e9.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556925; x=1795161725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=DPCXw6z4gOVe9wosedUCp+wa0Vl+Oeb4GAxsVZUcBnObgcP1Up301sGicm4TrL4OqA
         7P+fRRH97TFWdFUjVHNnLeMi7mzuZVq6ctbNBNfvZftsBsfGQ5I2IkK8hwoI9TTH7CZL
         VGdSHlEKyPVS1pWuvLN8qOQhy9oNrgqGnjDagFENfU7HAGKaz8sOEIYD9Hlj14XYEjFK
         ZUmdwIvmLpvu4Pme3iDzXdNKfmhlbbAsDGAw5sPS7iIf4yczNZuukzWOFcOzOWfG1RzQ
         RvYShtA4CtyCUNreZ5xa032T8clfLWtmj6bk65oJgO310Nj1Np9iNZPN9Aw6MDi1aJj0
         ynzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556925; x=1795161725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=sYt9Fb1x+Z+W4AZ9K+K/B0episeouYjYrU6igwyAHMmpghz3sWesEDqDB10cZAZjHy
         pbFvP+DSC45fGltXWH/QwSyqBtcq1lg61G/ff9RDQrD2qbKkbLoIeZJ0HyW1/hOFN+dL
         LR63elwCcfB+7Om9U/yPQDXHPMSa+vupWJ5nJgT/EVii6W3j4RpHK5TZsKOnac4OppTc
         Sjwt9bFpl/8ZMvgt6MZiRGM0Uyc/iWPWnbJGCm9HdlMQPMjhuROMl+5SX7ZckFCevIu+
         cWcabgCGkPO9TDZDHuhsmLLzte9RrSSMKEs9kw3IISJKdfrh/Wfg/jR10aQjEvqmkJIO
         nsLw==
X-Forwarded-Encrypted: i=1; AL+hErHzNLSQ4T7FkRPnt10c8OMR7PM5SB8BZXreXYWjLGOiGaSVsOH4g+P/ROL8RL899YsqbgI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8PYwcJ9XH6NqafJvZZ6PKiiC7QcyX/FNEcoqVsH9quDs6k76ir
	+/jdXjPzdiz+fplwh3AtILBxpZ/XmSASzR3duV6fX9ytZ1v0KTS18oFB
X-Gm-Gg: AYBFou3mN3IBfmzoRrGa4eJ92yRskuQvZF1exNPLjMLGzZaXBmHw0uxC4RFwp9XYmKn
	VOtMzhQr5h5GFLvdtQ8yVd/QuVaMrNILTomgyFWWQiySSyEg5fGMQfDiGQ6E2s7H4h74d+7oJOu
	qnWdEN/iGsO2WYYIj1orBZPUXpw/wTiTSldBkwC598YwARJyhU/A7I2IHFZ5zHDUW8MF2aIEdPL
	4TaLs9cuI/l6UvBNQsnbaupTsIKB7zF1xE8/+ml5c2dlOwN6ICXpWKUQGlmUyUY0M+E3u4zunbA
	iulZC7ikfHMtvLRSi0yvNIjh3sUV45Y/7n4fYvPIn7ydtW6GsrAU/yQLe3b5v5SGnKtgkAfDCRm
	datXbBvdDQedboq4pJOtgwGV87lvnpU4HvmcXXk58MFUapm+0u5qbakIA38wldOmjsuKwQf+mzS
	fJKiMJMxJTSl9zLaxYIKxK1EI0AfDXcIOksgZN4ieXIwmHTGxDavu1SFmFDhCrCcZH2ar/ebEvC
	27JxRjU+0IXjERis0ygpVCO5suQVg9FaRjtLsusDWxu8GG9j9Mc9X8Xag1ELbJOj8mJ0kCf8SPT
	P0XhxKmWc6sk1W53uTGtJKD8k/QIEovKQ4LH
X-Received: by 2002:a05:600c:c4a3:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb55ab5526mr35140005e9.34.1794556924633;
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm121590835e9.14.2026.11.13.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
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
Subject: Re: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 09:02:03 +0100
Message-ID: <20261113080203.1046422-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: 
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

A correction to the test note in this cover letter.

The v6.12.117 kernel I tested with is not plain stable. It carries a
backport of commit 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non
dma mode"), so its i2c-imx.c has the interrupt state machine of
mainline. "The touched code is the same" is true for that tree only.

For stable: both patches apply to 6.18.y and 7.3.y. On 6.12.y and older
patch 1 applies with fuzz and patch 2 does not apply, as the interrupt
handler is different there. I can send backports for those trees once
the patches are in mainline.

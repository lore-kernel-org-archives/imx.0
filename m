Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837050;
	b=Fck4q30RHoBUbCWBLhLYjq7H1Dd/xFeFulUGJFgjuU5SJFy9LyvRLYPqlUXKYXGyZ+MI
	 7kKIUYAHCTErDTJ9GzhD9kdOoqJXEwYC6wAUt60pv4CBe97OoiQvZH9beXgc/LEI4JuSv
	 /GigtskLwi470zhAbwqvy7un7QI1lqhrRYb6sRjax269YZhbWVWFXFXlbYwgYzweyF6MV
	 mhDosndhvWgPx4TKBJHPqf6gqDCfSJZABAkFL3Q7xGxpZHcCNa+we5LU8e/jcz9aHHqf9
	 LZHrpDV0oahE3DhOEszLNs5mgTPLAzLBft36FHMh3kHqFeXl2pSKNNmNQ4xCbx7fB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
	b=gEfzNTsWtdsEF1fs8Ab80k+9rvubgY9wwyyaLH5rU8JKWEHep1/tvy9bMmg23cXWOKPT
	 flkLkU5xuwQEBU8uOidHTEY7FVTxbWd1TPr8QYBg4Z5YvxJbn3y4+uiN0oyS1vgKfC6jr
	 gdyWvWaYvm+HLBZ9cCsAjPe05+h2e0JDY8XpFNRh/uCbgXN6iHkzi2rG/tb8q9RPv8+2v
	 eLdExD/b/drNpe5FMKVse3sSwje5FqULS8Ww8x3hPC1uVzJO/YlIXx/qaMwermIJhbxqR
	 SlzB5SLxVAj86r7lqOeeLLiWkc5u7S9BTZs76/GJReA3om0zQEzuoDdl6F+ch3Ez2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gcEOa1IF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8539160A6F4E
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 13:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8539160A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gcEOa1IF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28687445e9.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837049; x=1795441849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=gcEOa1IF3vGz1S/NxhhZHbprvJEj5odxDkcvpakuy0rsXAFQmXdSLg2uHKg4YO9Qc/
         CTXzka0baUE6NgFrzDifgxs4KHXEBEHFPaIFz++ZnHOWgRuNRWbE1WrwKvQtTcWs2prE
         OIIKy6wMNs4nBVnU0eNUujA8OHIW+pqtpE6ifIUglmiiV6r2xjKBexgZSJVC/3L86oqr
         OmVhV/StsBBPZ0pmE153xODO11NUZZamq6JdPVfqXxVznyPkqu/4c59kt758adOll8/c
         d5r20P2xEnmJUX0SjOnpMPPfiqcefvTckwH63S0jmYQiebYBdsj2jOluI+ueyyRrJtbv
         am0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837049; x=1795441849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=z3KrzE4aNOGrnKBDN/vW+ki4V6Sb91sqvaeBAR0naynTH1wfPjoIomePinEW0Y6Vy0
         0eMde8g39NNq2ayPUEL5cHWXsxr4+HAyZNEO28JsnLyWey7ILek160DV6peo4iXp5clk
         OKIfBXrF3UanqQxocazXm1VzbxPQWospY14pkrk5aX0gwyBGG0o5SemiNy/99lkr/bX2
         +TJTWAoRXeItKE4urBuRtGSN5wFscisXdRjbIIuOkVdvi+W19Mnj2Bk+/td2oUvS3jEs
         NPRRCRBkVNvODfGFmz/7upvcmfUcDYN8d0yjGu3j0mw+8tl0RT/CqziYP8s1gQ5EWvhu
         FigA==
X-Forwarded-Encrypted: i=1; AL+hErHk9V4Y5wK+mWIASzm5jbCDhs9gae6Y2dh3JPrDmO+9YXXjeLQnwUCyjP1L6kQYU9YG5MI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/4Z51P8NQB8ALFkCgooh4of2PIAM5IUGLWC5QZTmpMeR/hKoe3
	3aiWzXiUNV4aJ5RZ2U14MlMOLoWICQU60j2xoGMtQz+rzGQakVUnGgl+
X-Gm-Gg: AYBFou1j2uxgs7i/Ig2z1d0/CTP8E6AfWkz2uBdsuPYOYq/9RTAFawAX89Eg1Jvse1a
	LYO1P8iuNqJXZMBGO3YII9apQ+JJO68YJpGRAzoeQDanrqyB3Bb6KeA8R8hxilx6z9gRjEGA+mB
	hNNBORmHjEvQveve4Ms+9gjxgpJXO0XZkkTlpguyVh9pY2pcwuTwrwPUIxvb6kUP2NM6KLsoRTi
	11wyvgINd19wdtw/tUOqih3B6qfKpxXDu7hM/mkD3CxBzG0Q7SbKjdXb/wnGvYmEra6vTNwSt6T
	jEXHCbfleBNEL+zSHuxqfrHgjAgsTAVGTsnDVTOCvs+vNMXVScJAplSZwr1iT7zTPn7ZRZwoCF6
	09jJ4b5eb+CkhQf5R+NKXTVLOPbXMSVAP5vYKX76yTWs8vXzvHIQceIRC5aQvmSOdaRhKQk1UbE
	lPpWJxNBwAILcHhK7IZO5o3tEof0dmaEh4xMEul0TUmFse5rDEl7hZ84I14gwJIYbxDSKmtKqwm
	AULVynEaJdC9J+Sg1aTdtfMKgMUAFywjSzcawe/CpYhe1QoUmipbRnqWtwG5/vDiekLgiLnfhs9
	JN7VJ3qPqKzuhXQG9lUp4+p5DrB5GeQcTTXWpFa89FeY+/jmYQS8bUTY
X-Received: by 2002:a05:600c:1d0e:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb55abaef4mr221596805e9.24.1794837048913;
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6fb45a32sm69904235e9.1.2026.11.16.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 14:50:47 +0100
Message-ID: <20261116135047.1379330-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116124430.1358948-1-mehmet.fide@gmail.com>
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

Sashiko is right: with PEC this NACKs the data byte. v2 will test
i2c_imx->msg->len == 2 instead.

Mehmet

Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8372557C
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041375; cv=none; b=fSquYUuJU4OKLc+AppC0ZOgllL2p3BzDF7Aqsm7P9pBLH3+HVw19hpOVfbpZy6R/7mcVapfwy6uRiSCEmvpht8tVDfECSIBL0z7uB+CRx78htdlqMIdTB2MQGY/f+T5+g2yFTpUVHJNiz1rY/kOXjS34/BFHe6nAd/LkRir3bAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041375; c=relaxed/simple;
	bh=O3C7uq630jm71uLvTsprpfnaILaO+mhLkrtM/mSn+Io=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E7yr9HgK8P12oAn/xutfJ1ugHPhBMzJDlC78k6WZ4jF509buttevGFq8TQHoYWbzTXlLgXYZV8TijFhryANw3iFJ7ulQ/HJ0cAxVhBIPf0RbjmjPWDep8L299Ruq7gRmB1sYhNHA0tfhOSNnaiNQDlTYa9/FvLd71eIjcP7kGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eckUUxA2; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eckUUxA2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3758A1FD31;
	Wed,  4 Jun 2025 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749041371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3C7uq630jm71uLvTsprpfnaILaO+mhLkrtM/mSn+Io=;
	b=eckUUxA2APfhQGqZlY2rvleVkrla+8kzfXWBH68VW4pTVm7zfxNqIOnd7W3eD98a3FbfZp
	nGydEkux01A+J7t1fhWx8pksdPRFcyKv8dBLY1WNykh+GH/dDJTzmrCiHs6Ast06FiyzHZ
	sQB6fYfgPPGgCsePWMJllbGK3C1O1Txa3AZIQNqiaIKVN9YzOWDInCbtGF6mG/N6/iautG
	FfCXDRHmkJqAdb1xJR+6wgCbF69U27YZDq6Vxg+r48MAijhKWZ5jfPsaHqRmta3emXIMSJ
	PiqFkJXSa2PJmgwoylddpGOnmt5OcVyPnuf/IjscsKL0b3BCTBghaalcuy+cSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org,  Frank Li <Frank.Li@nxp.com>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  imx@lists.linux.dev
Subject: Re: [PATCH 4/4] i3c: master: svc: use adapter timeout value for I2C
 transfers
In-Reply-To: <20250604101831.56585-5-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Wed, 4 Jun 2025 12:18:30 +0200")
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
	<20250604101831.56585-5-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Jun 2025 14:49:29 +0200
Message-ID: <87jz5rk6xy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepihhmg
 ieslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Wolfram,

On 04/06/2025 at 12:18:30 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> I2C adapters have their own timeout value which can be changed by
> userspace if desired. Use it for I2C transfers. The default is 1Hz, so
> the default behaviour is unchanged.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

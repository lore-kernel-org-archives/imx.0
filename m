Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9BC1F80DC
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068184; cv=none; b=Ca4ykcwSrc0zYraMjH+6X8uBMVklgAdtTXUaa17KhmOxNqF8ZHgyC8XOAp3G8yFsXOaejhBPc2H16rk9J5P0u2CeLVB903MnUgc8LEbPL3aIqU2waY0i0ggnTz5oMjSyu064hH82t8CZR4zA3iQn5Wj5DIDGzhMJ+vuG2mRVGPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068184; c=relaxed/simple;
	bh=jzDEQX0G4aFdYBgBD8Q9TVHHCXcVx8mUrzPKx46F6UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3DesTClBfmf/0zn+mDBapNqYz9tCPmpLMwiIOJxheEhyy1UoKTNKU9SuWOtxKaZbGME9iRzWNpahaWcC+Ot/6dpt3WaxmFVofy9kAuYwBcMK8q2Ywtz5Pq7sBwS2KJgu8kjlKJ0KggUimyNTX2PBAqdVVWc80j7CVl3cWoW6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HEENpf4S; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HEENpf4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8cxRSQIWKMfv15uvq9UbQkjHI3xRuImVJscKgphQC98=;
	b=HEENpf4SpRrJHEpj+Zhrj5da5JQGEtelKCSUETcT4e+UMtQHKtjxglAJR5KAtE
	Pe21yv2hrClsDEA0YxjmNWki3ftRr7btgi6oQfSqXH/NEjfxzd7IwULySUsI73E/
	SIZfv7lzF3MTh0I8Umvm8/TH0HPZ4D5zgZ+uTYa8bdZxw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXH7OBfA9n8OQZAA--.452S3;
	Wed, 16 Oct 2024 16:42:43 +0800 (CST)
Date: Wed, 16 Oct 2024 16:42:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, aisheng.dong@nxp.com, Frank.Li@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8: Fix lvds0 device tree
Message-ID: <Zw98gEMgXbx8lIjr@dragon>
References: <20240917065801.2579750-1-diogompaissilva@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917065801.2579750-1-diogompaissilva@gmail.com>
X-CM-TRANSID:M88vCgCXH7OBfA9n8OQZAA--.452S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxB6ZWcPLTjrhwAAsV

On Tue, Sep 17, 2024 at 08:58:01AM +0200, Diogo Silva wrote:
> Some clock output names on lvds0 device tree were duplicated from mipi1,
> which caused an -EEXIST when registering these clocks during probe.
> 
> Fixes: 0fba24b3b956 ("arm64: dts: imx8: add basic lvds0 and lvds1 subsystem")
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Applied, thanks!


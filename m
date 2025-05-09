Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B520DD72
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800984; cv=none; b=aDIE6sc6Qug81pwdhBDdkyzhGgkYu0134bf91ZhxqzQEEceP/ZxcP5wKa3VqfgANgrQYq8JZqTomVQHDnw0hdcSsPWkJEVbzLfIdFznke8x9ZmYaT71SsA2zGwIiKfOlN9JS2I0xY1BuQHsbcacYapF1chH+i5ZaHVnCbGeWTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800984; c=relaxed/simple;
	bh=UkL+Tbb3pLryT8QwK18QVZZkkTDUt4vUN1WoTUSl1wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDh05kAZSqMvTf41zy0y1LPuy00eGLvfxNePujJJZcCcbiz5StrlTDwTOC7czFP+ucp9V8tZZxWhpLbI9tzMHYU9WR1zPBgF5P5Rfjyden8O45X3L5YFtFX0+a4u9XQU0DQ+HaDbMyBtznkC8lmc+YQu8BO8/Jrp1MNLpsAgNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Z2j/FoMm; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Z2j/FoMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C5AYazuPd/fcyYmxz8UgX2gUqYJg68sV7yEDZF6Ac8k=;
	b=Z2j/FoMmM1B6nMqmxTXkyKpKI1Q23ZHbBAaxFckG0nJ2anf2wLhIBhq3YFfBlE
	0kWq6EuW1yarP2Rffn7hCp5dc8WnhHfoiVfmNkyjY46jbD4YOsE3RQ+7FZw677a8
	dZ1qiS4Bg8jLwWRYdrc1K6qCs0FI4GPdv2htUFge1Bn/Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3D_Y4ER5o8mGoAA--.35470S3;
	Fri, 09 May 2025 22:29:14 +0800 (CST)
Date: Fri, 9 May 2025 22:29:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Efe Can =?utf-8?B?xLDDp8O2eg==?= <efecanicoz@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx7d: update opp-table voltages
Message-ID: <aB4RONqJI4Gdf/tF@dragon>
References: <20250425091853.54437-1-efecanicoz@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425091853.54437-1-efecanicoz@gmail.com>
X-CM-TRANSID:M88vCgD3D_Y4ER5o8mGoAA--.35470S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh5IZWgd+axyowAAsQ

On Fri, Apr 25, 2025 at 11:18:40AM +0200, Efe Can İçöz wrote:
> Update accepted voltage levels according to IMX7DCEC Table 9 Operating ranges
> 
> Signed-off-by: Efe Can İçöz <efecanicoz@gmail.com>

Applied, thanks!


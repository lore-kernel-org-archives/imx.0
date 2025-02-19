Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527AA1C2DC8
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958387; cv=none; b=pK+ZQYafuBP360CyMWT7Z9eQZB8m4GQVk+F5+3W1Dy58xsh/do4+751ILOF1e2U7KfYV5RUel6yb0AjA+ERJiO+fB+Rgp6b4MbgOA5zNbR+CsiF6admWq3KBRSYoOatElYwdeqcbiM2UCp19j+uK+CMS5BGMm3y3XRIoCTRl9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958387; c=relaxed/simple;
	bh=nqcf569tnHBYYnblboGbp3DFWVxOzvikyDaKLTRVL84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7OlFMce6+T59K/EKAbX8hld9kd83tUrRBXusDh9ejHVBFBEGKviX5/JuaA4CZ44AmYXNrub93w2mekjgYuWUnEzK9nXZtmbkqt5kmjx62r/Z//nZo9arDg6bjZqL4iFuckoo3mALxz2U1j0f9LdRXITZHwcJ2UoAb4iejj+KXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CCsAnE4o; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CCsAnE4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JTw76i4BbtQyQih5Zo0i9+iSWSO7S3QZcD6OOv8jjac=;
	b=CCsAnE4oKb7Sp6POYvhvLDSp2ItTrN1MPTzYHaSuV4u89vhRSxu/w1L3VmrzYK
	NAIQbSFZ0fGBL+Gv+A6Og301Ph35ZVPKfbggrbhn/E/t1keW1Lg90qTkqNgKPz3D
	O6DCodh+JvbscRvJJoN+yEQTSEGjSXoTYLDqxKzyowD2s=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3e85RqLVnYuNOCQ--.19638S3;
	Wed, 19 Feb 2025 17:45:55 +0800 (CST)
Date: Wed, 19 Feb 2025 17:45:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: match mxc in file names by IMX / MXC entry
Message-ID: <Z7WoUSBvNZLAEm0K@dragon>
References: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
X-CM-TRANSID:Mc8vCgA3e85RqLVnYuNOCQ--.19638S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5tw43WryfKrWDZryDZryrWFg_yoWxWrc_uF
	Wqq3s3GrZrK3W7JFs3tr1jvryaka1UArn2qryYgwsIgayfZrZYyFyv9r1DJa40grnI939r
	uFZ0qwn3try7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR-4ZWe1nVcu1AAAsp

On Mon, Jan 13, 2025 at 11:13:01PM +0100, Ahmad Fatoum wrote:
> There is a number of i.MX-related drivers that have mxc in their name,
> but are not matched by the i.MX MAINTAINERS entry, most notably the GPIO
> driver, which is still being used on current SoCs.
> 
> Looking at current files containing mxc in their name, all of them are
> related to i.MX, except for:
> 
>   drivers/iio/accel/mxc4005.c
>   drivers/iio/accel/mxc6255.c
>   tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
> 
> Therefore adapt the regex to match all mxc files, except those above.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!


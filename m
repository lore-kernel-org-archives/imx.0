Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD531AB6E3
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727342137; cv=none; b=DNhGfcTthWEQ5mQ9bG0Z+5hpZtWtBNOSb87TOEsu37CyoiBFPAnEpZ1kxKB3j3n3ERHWG6sifxMn7RNleGA57u3ij2WnSKXBOEw+/8/+AdLHnt7uQgjke+JAWGCksZS6BHVKDY/OSGw6WUoSR8j6CbihyHAzigCvI9AZ75Ue5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727342137; c=relaxed/simple;
	bh=0WIOXwh6NxwZTYWeO/StqiCB1FMCUjG4qYyje+4DacI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiwRSHdxT0bhfI36Bq/TB+19qVY8TNUFEDJqlDfF0Ui88nwTu3MKFpZ0bR6tGZSsNffQuccUez6oUOKt7fLkxc8PDYeD85GS1LX3zrFXLVWIS0RtKzMNWcizFjXe3eTANNPPGQyCd9T+gVqh/svqQFY6QrusFO+TVwGV+fK+OrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EwByxsTc; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EwByxsTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0WIOXwh6NxwZTYWeO/StqiCB1FMCUjG4qYyje+4DacI=;
	b=EwByxsTcd0e58tLdLMbTjebpnjs8SD/d5u7CvdHTZbf2j2j47yiWXkvSesvn2N
	7ECl4RD+nMDRuvoBnovC0rrWgsjMwtd0QlLLPV/FKhtIjacV3YEp0Pc4XuQlGcyZ
	P1UwOfCHJCRcYp+8lur2U7EKOP7wtr0yEBinjzEjJ/1EI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnvMSnI_VmBtwoAQ--.24117S3;
	Thu, 26 Sep 2024 17:04:41 +0800 (CST)
Date: Thu, 26 Sep 2024 17:04:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.li@nxp.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com
Subject: Re: Device tree node order sort tool
Message-ID: <ZvUjp5uSo0SSyPAZ@dragon>
References: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
 <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>
 <20240918-igloo-unspoken-45443a52e338@squawk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-igloo-unspoken-45443a52e338@squawk>
X-CM-TRANSID:Mc8vCgDnvMSnI_VmBtwoAQ--.24117S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVG-eUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgFmZWb01VLumgAAsh

On Wed, Sep 18, 2024 at 09:17:37AM +0100, Conor Dooley wrote:
> That said, I'd not enjoy getting a bunch of patches for the platforms
> that I maintain redoing things in this order, so it is worth asking the
> platform maintainer for their take on whether it should be used for
> anything other than new code, before sending a rake of patches.

+1

I do not like to receive tons of patches churning the existing files
with such order changes.

Shawn


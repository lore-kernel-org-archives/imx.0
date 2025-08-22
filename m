Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C12F6167
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856096; cv=none; b=MtzX9zPcTpsRb8w93327g5ETiBImfBIWk8Xe0gUk2o/4W5OLJ9CKj4WlBzc8KRfL7iezndZHyeoCISkgyFE1MlisckjviCvOQLC83ExnDgEFgt/iP2Qj+L0ulEBXJ2axqVQr56Oc5MFthugq/RJHi11G42kT/5xCSehpzs+7YtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856096; c=relaxed/simple;
	bh=2QsJu3yXboIRRm8gyW7Jt8dyGncvWnz0qkHWqzHKbvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAEwlSCsFuHCtsj12QrwlblfE2KuPkRJj+5h7xdELaedCC16hQfYPzfiW/7z1aag2MN49ne6D+eREnLvHZAccsU1rCRrDb5csPeQCWJw8Hbz7lrl6LAnOBOQ3OyQTVbc2x51gCScZYsp64hJCMmHVd8o3NQ+PbDam1O3wsDFtDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JkxhnaG0; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JkxhnaG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TFE1vXshyXTaSAq75tk8hvRjBufHsERPehCPxKwyz/Y=;
	b=JkxhnaG0RP/J46xlp4ny1LqUom0swzep239Csq1u8pUeX38n6/Q/MzGwcAZOmx
	HeUHK8f9P6Sx/kXcL2IMGW6z8a8ZIY8ununhpvg1ytT13FaM1J/6KMuZARezHxuk
	yGFshu8X453OrPSS8sWknOY+PKNoPkxaAwA7nHHgM6kPY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXDvfJPKhoQqEoAw--.8192S3;
	Fri, 22 Aug 2025 17:47:55 +0800 (CST)
Date: Fri, 22 Aug 2025 17:47:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx95: add fsl,phy-tx-vref-tune-percent
 tuning properties for USB3 PHY
Message-ID: <aKg8yXnj3AMfZ5Zq@dragon>
References: <20250821110828.20980-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821110828.20980-1-xu.yang_2@nxp.com>
X-CM-TRANSID:Ms8vCgDXDvfJPKhoQqEoAw--.8192S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgexZWioJsE4MQAAsv

On Thu, Aug 21, 2025 at 07:08:28PM +0800, Xu Yang wrote:
> Add it to improve USB signal quality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!


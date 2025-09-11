Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904C329F21
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561612; cv=none; b=rZMILqamRbKhPCUxQhj1bS8v7X6Y+BD4+LUHJ8KBdhz8779js7eEynp1bVSZZwxsCDeFj7H2DsYbyXSKrd84IL/ACkS0eCjgB3ZiSaoqKkw2v9HJJACukw2LqeEvUgfm6uFG+ZuNdRplXFIFj54l36uJJfHG+kwrinGgVCp/q1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561612; c=relaxed/simple;
	bh=Xv7LqoFiazY/1FA5081CUy89DKBDEfG9HSv8i9xRUWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dn3RpPaaYi/vMzwhUXF4ZdBCtnwMhm7nKrPzpQb4NO9IA8MpiHPCf2H0vgCZQnefiiCNeBPrj1CygSf4iZZ2srLozi0ldaoIXCu7oTzjUlpWfsMQFgjMbmvY00OtPoAD2dh4GfMN337YN+CeDoCwbSX4wrcrJOvcYbSWcyOFHBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bXCaCvHh; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bXCaCvHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=w/N4P0dQFX0EiNShkkaQjSdBZSD1JMf6VXokKtscJKs=;
	b=bXCaCvHhgaZtl6WnJ6PdFtKTQRLe2b9PB633zfLNNEbjWVQ05sU4IXZp55N7Rx
	PX+bOT/11xj/iJVF8qtIJKwys4ipRNE4WF6dP36ISSh4Z8a/9GQ1MAq5mjgb7bQK
	LO9GB2LzdxqckIKq0rL3YmQSyWYZL1XCpZJlzgMzrIjNY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHddn3QsJo4KJgBA--.47756S3;
	Thu, 11 Sep 2025 11:33:12 +0800 (CST)
Date: Thu, 11 Sep 2025 11:33:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6sll: Use 'dma-names'
Message-ID: <aMJC91yfcxtSL7e-@dragon>
References: <20250908164431.67052-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908164431.67052-1-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgBHddn3QsJo4KJgBA--.47756S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUY73kUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgDFZWjB-Squ0QAAsz

On Mon, Sep 08, 2025 at 01:44:31PM -0300, Fabio Estevam wrote:
> 'dma-name' is not a valid property and causes the following dt-schema
> warning:
> 
> dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> Fix it by using 'dma-names' instead.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


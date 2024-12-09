Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B976022068A
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747545; cv=none; b=QolM1DKZY4QonuUvK+5kS2mXsT3JuMg+fvWbPeES4lAYsa7U4RjMhYftGlwya5eYc89YYodYab1ix6hd9KfRMoLIWGI/qin3g7rQhqNoYtU7TOSEEhDGxCDJ6MZNIRnh/Y09c7vyW+hwPXXb9upa3Q0q5+PEtL+qoZ3AJrmAXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747545; c=relaxed/simple;
	bh=locmv9bU7swIPpoywjbPDhPcbAaiqMU2Tsk33gzmpUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEm+k3uJINTxKR1v1fwpQvETR6xUOHgda13nU7BhJfBOsD6TXVlFAGa5R+i3sR7bAimoWAZh7l9xWRturi7+GMbwH8UNUDJIPoaKelItuzFuLlRXmy0OG0KLn/h5DoYjh6kEgSbqO4nV00ouy3Fv0+dQUqU2GcHLPFNv77dzAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Di7ejoNy; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Di7ejoNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=a9t1ybfU0p7i8XBRjmbNqnf9Mds9LGg2edrrvPPWhKQ=;
	b=Di7ejoNyYcqLxWzulNQP0tYoJbO8C8F4kYu+FAb9NdrJmszrWuusAJLAP1Ja0Q
	YeNNLOvd/pGKQU6QW7mRe7EsBYggrE9a2701cmVYkXUcD+58w07hyAtNTegNJwNB
	H54wHZ8uKZble5GadJec1OzCtVq/e5MtZkyhfZe6YzC9c=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3vA0+41ZnRTaQBA--.47901S3;
	Mon, 09 Dec 2024 20:32:00 +0800 (CST)
Date: Mon, 9 Dec 2024 20:31:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v6] soc: imx: Add SoC device register for i.MX9
Message-ID: <Z1bjPhQxV34bEZS4@dragon>
References: <20241118021716.396001-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118021716.396001-1-alice.guo@oss.nxp.com>
X-CM-TRANSID:Ms8vCgB3vA0+41ZnRTaQBA--.47901S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUslApUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEROwZWdW4JcK1gAAsN

On Mon, Nov 18, 2024 at 10:17:16AM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Applied, thanks!


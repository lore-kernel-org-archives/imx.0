Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E542111
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740294460; cv=none; b=rry+5AkJ1nG1wXlbMQhJMWHFg51FYp6f9DytjSwWS0lKgnyojhSR+r3d5hABtoHyuBTNCCBFjzWf3spXpkahdniw+KsuknvGFY9OMwYCwsqKGO+WdPP6BIuZ0ZzNzLDXAmXvqS/c2mGYEEYYiwWOl4yhceB5hfQGaqLGZI3b40Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740294460; c=relaxed/simple;
	bh=K9KbJODbj5DWSkcFOlQEvI7mnwMX8YYi5qod3+jkGSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYbqe4Nj5jUAPQVYqo3cw7HVuaWIeZFJf0q2hzKkWdpCYIZWMloIHr2Enf8bcGwwMXYa9d2RKQbKLOfKdhoBfBlS+XW8uIXsqlbfnEICVD87Gee0JcaV+ycSB0t3THEAlZlG8Up+Uhxay/uxnoeUnSt2NZUYQYs5ODUTYfsxKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pwiskjuR; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pwiskjuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HJyf244BKYlmxx6vt7GoqUcdxk6vRqqaQBKzOBNAKR4=;
	b=pwiskjuREwWzmU2YFTlaqpcyXqeUMxp/OSfnAqVymbXf9hiw9Lvtd+aoSjNZHe
	BUYwi1YXBYOj5bCWYD0HVnYRlE0r6lp4+qthgYGqkJbRtoulqY9meTBgNnJE6azb
	lQndUIoPaIjdjeueuP/UIS8n3dTWxJUZRp/W4vAFhnD+A=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3CsgOybpn9z2LCQ--.22768S3;
	Sun, 23 Feb 2025 15:06:56 +0800 (CST)
Date: Sun, 23 Feb 2025 15:06:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: imx: Make IMX SCMI MISC driver only selectable
 on i.MX
Message-ID: <Z7rJDYrPFf9dS+9t@dragon>
References: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
X-CM-TRANSID:M88vCgC3CsgOybpn9z2LCQ--.22768S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVxR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQf8ZWe6ksy3WAAAsj

On Tue, Feb 04, 2025 at 11:15:30AM +0100, Uwe Kleine-König wrote:
> This hardware component is only available on i.MX9. So don't offer to
> enable this driver without i.MX support or compile coverage testing.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied, thanks!


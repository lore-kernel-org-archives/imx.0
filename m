Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103CB4C83
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853305; cv=none; b=seKbQbVExLttsJdqe07pFJpAokuimHh7XzrX5FH1lWEcwP4V6WQlEskTL0xZWDoSrpYDWRThDcCzF3aGEhqwXrrzj2lnYiVt1pDSmStE33z/TwxH9Qmnd4edUDbwhpL2e0GArGUa0uJZFfkyuQbzJK6BUU/U8/rcPzHagrEXqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853305; c=relaxed/simple;
	bh=ZZZjeWgCzgKLE4noZbJnjmwDp7GDDaCCQZMrg3G/O7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQGWoImmfNLQ9wUrrWgWmxEJ0kLyOWL3if3pGyoxvUREFWE7Q7rv1k1KgEVVHgZdOiESTNRj6M8hZt+FDyiQVpPnFlD4xGcCSC4x9PNMqozyIn1xT1JDzBfAQMZcDELbUzMiaPfkYrw8wjQnRATC9RjT/wdDp/rE+Bw5+qewnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FLzuYBjA; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FLzuYBjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N4dSGioxFo4M4rdf3JnJE8WIclENgwBnsbRifgmAlrU=;
	b=FLzuYBjAM80wv95phdoRt2N8B7AsAOOGMEetr6qoM249MlSG09cL7yT0nQ227p
	/BKCbxL+P/YHOWOh01wxEzA5lExpIPKDxXp9OiRoKgF/MStlBRchyCW534uESgXn
	ptR5AsYflE4lqaz0eHzOYZRdhvI5Fc+sQ01MQ0RJiSwy8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXRdvcMahoDisoAw--.17475S3;
	Fri, 22 Aug 2025 17:01:18 +0800 (CST)
Date: Fri, 22 Aug 2025 17:01:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on
 Data Modul i.MX8M Plus eDM SBC
Message-ID: <aKgx3DOjkQYYGFAc@dragon>
References: <20250810160500.10213-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810160500.10213-1-marek.vasut@mailbox.org>
X-CM-TRANSID:Ms8vCgDXRdvcMahoDisoAw--.17475S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUemhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNh7HLWioMd6MNwAA3W

On Sun, Aug 10, 2025 at 06:04:32PM +0200, Marek Vasut wrote:
> Add missing microSD slot vqmmc-supply property, otherwise the kernel
> might shut down LDO5 regulator and that would power off the microSD
> card slot, possibly while it is in use. Add the property to make sure
> the kernel is aware of the LDO5 regulator which supplies the microSD
> slot and keeps the LDO5 enabled.
> 
> Fixes: 562d222f23f0 ("arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


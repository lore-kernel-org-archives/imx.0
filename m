Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655D41E3771
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503779; cv=none; b=dQrGiuBGtHTes3hFZLgF9LE1GshaGnmPfvVnTqUr3Qe6xZkJFl9OOK1o1C88Qy25F5YkrkSXBEqAsLSOqDofjeyHqUetsYMWIg6m0aKOvvL1gFSQ4DBMCTr4vuo9LC9u40S4eX8aar9KIfYMaDNy0CwXvbNuHmEwZB6K/7oviQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503779; c=relaxed/simple;
	bh=OL44tXeoxalIZKSmbvd+NvtT+kQ8M6pJ8t8GR13R0wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Algl0/zxhCb4VcIBDQNeWCm9Icpvt3KaJnyuJ9uqkBiz0E3qUBi3kLjkR+e5l8qtbOy/m6V2p3ephfo8yZxiE7ewvSA9yXCeWGxWkbrKbhTq740Ri3IPbHOH8dS4cf5hz888EbuBvpH7tbaKqamShx8rlofEeKrR9AGrNNMSS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZWAykMsO; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZWAykMsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YkZ4qiiMuubjDD/b8aOn38w6UrzOXZrqBqxzSQrF+Dk=;
	b=ZWAykMsOQ1ljAeLPFa6AMNUqHm4addGoow458FJRQAMYUV87+3GQ39jxuXDiTa
	zd0LsHDf1UZAQfL85pxNKZVBZvFXA50uDqm7s9emYptozxJ7hfWBcFLiTjMHqas0
	14wKJokvmomA5efRh37o+L+kFWolzEU+do7lqxgcJQjeA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHr9ULIhZnXh+EAA--.4753S3;
	Mon, 21 Oct 2024 17:42:36 +0800 (CST)
Date: Mon, 21 Oct 2024 17:42:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <ZxYiCv6SpLq9uh08@dragon>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
X-CM-TRANSID:M88vCgBHr9ULIhZnXh+EAA--.4753S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4IJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAl-ZWcV6t2pkwAAso

On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> So far, only WFI is supported on i.MX8mp platform. Add support for
> deeper cpuidle state "cpu-pd-wait" that would allow for better power
> usage during runtime. This is a port from NXP downstream kernel.
> 
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>

Applied, thanks!


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E583D1CAC;
	Sun,  3 May 2026 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827219; cv=none; b=ULuOIfmA2PMtWkWkGFDSD3VWDWp7SyaEY2hQRS9XadZCyAnXJOrQwKsHeynnHuUYVEf934ZJP6DHs9jIaej0XoBihcY8UJlm6fMUTefGYdmDKugW751TN67M4h7nc+SiJgsV4bihZ8OLi8ccFVpZKWY/AO3+awyIvX0WlGvxEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827219; c=relaxed/simple;
	bh=1Etpq6wnGwOr5oR0u0952ST5kV6ZQp1I+Y9KByQY0Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q98WVcnsWidvrXCq4xkOtFTtdYzU8eWzxIJlqVCC0zjjqAX15OouYDe8+CJ4DeB1LxucyRGIRKNSXhLPuj8TrR6+FasIgnAhn5Nqc3tp38XTvMol48Zc8h6u4Jmt7oq0VzZvD4EDclqzLBFJdyUq7xfU+jRvxTNpe98NW2oo6FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghW9LrpC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghW9LrpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61020C2BCB4;
	Sun,  3 May 2026 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777827219;
	bh=1Etpq6wnGwOr5oR0u0952ST5kV6ZQp1I+Y9KByQY0Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghW9LrpCOgQpUpZ6bt35gv9JaxPFBItxyJkeSUdmr8HmMdSQ81CCNedzh4qF8kb2U
	 xNtoEOXtZ2L+CCm/4a2hUqrGZ0BbqTTjSqKIQLVOsxTAlOEOumoxBmQcW6ZELL7okp
	 Wbn7S7zmfJN05INga6GyQ3euRVkhtXVPm6dYGHp3quwMW5zVRCZGTAcLC8mKpNXIi0
	 fI/Al4q2y9c+CjhZIh99gUltSQIq3yNK2HqDOrpmtMlJNN4B9Tn22fQbEty0fPLUGR
	 fAHzLWtr1EN9cGIh2HW45tymrTpfP30G/+Ot9WyRXIIJJ9EeiC9j56VqTem5wkFdU6
	 eIyrz1g5Rfu8A==
Date: Sun, 3 May 2026 22:23:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Parshuram Thombare <pthombar@cadence.com>,
	Swapnil Jakhade <sjakhade@cadence.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v22 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
Message-ID: <afd9juuQh8OB6SEw@vaman>
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-6-30a28f89298d@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-dcss-hdmi-upstreaming-v22-6-30a28f89298d@oss.nxp.com>

On 24-04-26, 11:07, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> 
> Cadence HDP-TX PHY could be put in either DP mode or
> HDMI mode base on the configuration chosen.
> DisplayPort or HDMI PHY mode is configured in the driver.

Hi,

Please consider if this can be split from rest of the series and posted
as phy driver

Also sasiko has flagged some issues, please take a look https://sashiko.dev/#/patchset/20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d%40oss.nxp.com

-- 
~Vinod

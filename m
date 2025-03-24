Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104021F1314
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 23:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859748; cv=none; b=Slv1bcPYVpYa1s9G++JkTvpEsjY6dQQqt9lh6AjLS3Nk9Ew65IS35F86k37t8x7GerhMBEZhzCSMBKjbRv7R7cOTs1h++lzPtOV5JiJWkLAuB4Fqv42R9ht11IHOagQjQcddfYlagRj8bUzHpU+P4ktBTitl4sSUo8kV+5L3g1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859748; c=relaxed/simple;
	bh=wxD5gcM8zivFfW9mw2W7EzNeto8ww4Vzj8XHrd/bCqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifb/bE3Du4AgaYScvkkDlp76ypNuQX/asdYDxWaTZ5iKoDjtBeiMgpXP4alcOGe5CSAcJjRJBhb7o/psRlQr7AbavaacMCHCJr/3/r4b7+3qoO7BELbLqNJeYfrDn1PCtizAy3VpPu/AdBIY5egN/7oCRlPyHWrLlI7B0qQuQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=X7Id/hJw; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="X7Id/hJw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D02102E64C5;
	Tue, 25 Mar 2025 00:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742859744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DCG3+53Ac+NbhT3mtgTYia80x2WwrmGFmlhhWvxOySk=;
	b=X7Id/hJwMMfgB0C9wYwS8eoklxUO3Gfdi/tiA2c4XrPzD81QJrVgmAuSnh35YOjmvepPgN
	T0Dr8g6R4rFRyJPtqTb6ptknSSJ/tHWWkMMnSc2izK7WCmXjNMEBFKaF0LS5v3O5qyjQ4v
	pPfkSx62Fb/OU+WenL5P2cxpq8ju+WOtTCrOtrCtA71aylkAR5MQ5e1ilJNOWvto+CTRdO
	Mj8bys3aLbFmmUpZZ8hBFZAucM7mnNdxXvRPjUvKINzY/dCjJBzaZu04zIfy6QeU3v5fd/
	Mv9J6pb3EMAJs9L/a17/boCilMZWftlQxjJABjlASwS6dNXtbU1LJtgGgGsYYA==
Message-ID: <e8e9f36a-6d05-425e-a0e5-89689424336d@denx.de>
Date: Tue, 25 Mar 2025 00:35:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de> <6144881.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6144881.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/24/25 8:02 AM, Alexander Stein wrote:

Hi,

>> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>>   			};
>>   		};
>>   
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "nxp,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +		};
> 
> With the SM release lf-6.12.3-1.0.0 AP does not have any access to
> this BLK_CTRL anymore. See [1]
I just built SM 6.12 and it still requires the reset, without reset I 
cannot use the GPU ... or ... which BLK CTRL do you refer to ?

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD68C1F;
	Mon,  1 Jun 2026 02:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280369; cv=none; b=K5xEOng+Se8OsSpEy/Tvt1l96lz+5HwUlsWJC6CmUOw8fRlEwpvyQK9DeXgyf9esUJCdhynOc3Z+sEEeLqvuvuX3EbGA7dnb1Ojp6pVorATz3Xe8BXdS5htnEfF3u8Ve9lYTKRIfOZBKbXuMBxgC7eFnO+mbueZKxISNVQ7bBFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280369; c=relaxed/simple;
	bh=gy2qVtpBDZPRTtVE9t64uF2iZ2P/HZqHamSEDYjxkpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2f7Jt2qL+C163Mn3ngpj82JiAPHLMs01itHI3I9pQdeg3vik5TYVqn0wNYzcZFgQwY2GsONuYKnYlOuuEuNJDd1nlByMRZ2XlyWM5r3+XEL3Hjzc+jjzgyciOprGd23HoAUl9L1nuQ9WYZoH9o8zooFlzegA06W7KuFS8FQK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/JgH3uJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/JgH3uJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B9D1F00893;
	Mon,  1 Jun 2026 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780280368;
	bh=G9yThJ9a/KxJE4BiHKGLw6zyO+alv6QEHk8XlwvlU44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S/JgH3uJn/tTEWKW2YGWvJ6PwSk2Q0C58E2YPCNdds++QWo94xSbeAam3TaOn+6LR
	 obJ/DBlAfn/Ixu+RhhatavgPDKeoAQlfYf59UUNI4QevGVRLrdGRJ7F0+agWy35AO0
	 uN/l3ewNTyOKDFEUIB8EKO50BiZ5yocyxeQ5iqy9CC8V5/UcREqmvTo266U3mobx9O
	 HWrIkB1JM2UndkM4GbOp/AqN2HzjDR+oTD3iWw0W3E7VYxZGQFE3Orarb2XwgMUquD
	 jJsTERGbBs+HIDWbhGZ2uqDegMpJy7oo7peJ8Hnxpkx6gYlOO8rUkorCkONjGpc2+A
	 F+U4IKLeFQqSw==
Date: Sun, 31 May 2026 21:19:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Brian Chiang <chiang.brian@inventec.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	imx@lists.linux.dev, Dixit Parmar <dixitparmar19@gmail.com>,
	linux-kernel@vger.kernel.org, Wensheng Wang <wenswang@yeah.net>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Message-ID: <178028036733.3960577.5236610133789930332.robh@kernel.org>
References: <20260522203810.832631-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522203810.832631-1-Frank.Li@oss.nxp.com>


On Fri, 22 May 2026 16:38:08 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add freescale 2.4 GHz IEEE® 802.15.4/ZigBee mc1323 to fix the below
> CHECK_DTBS warnings.
>   arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: /soc/bus@50000000/spba-bus@50000000/spi@50010000/mc1323@0: failed to match any schema with compatible: ['fsl,mc1323']
> 
> Since the i.MX53 platform is more than 20 years old, it is difficult to
> find detailed information about how the MC1323 was used on the i.MX53 SMD
> board, as the functionality depended on firmware.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> chagne in v3
> - fix warning message
> change in v2
> - add descript about reason in commit message
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


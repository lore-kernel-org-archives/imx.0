Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED923D7F8
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763298276; cv=none; b=LGc0vI5IvfWBA0TM0AElMm1D3V/HqCZgzpW08RTGXl8+qLkxnHGznkGjPE5viqdWTsfnrle7rTyTItSg5/uMBENL9Qb6t0MC5kwcCAsSOJoTD6+/LcgTbsy3V0MwTG5xROGuKk9+P8YEOR2jlU9+mbjw96gg50FWXkTrN63VTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763298276; c=relaxed/simple;
	bh=5tTViuWQeq2fEIoPGWGnvwQiVb6HB24Z5AzoWDaOkPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s044bH9qntIrFwvTfXqgjAweSVzlsSHpXq4HladDwSqhXeDDL9ZZRUddoWgHf7Q1L4cClkpsSShO8DJz+R0ikKi9lUGaOiYXkMxLIre1fN+84LIn6ZbQcRKeaWjdMV7rWIWENjm/pYMd25r3PusaNxp9xPnrle+2Xxws42hcmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SU395HQK; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SU395HQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xD3VrrbFBqMD7ta6tnMBubYSY9n+il+4lLi4piuAG+Y=;
	b=SU395HQKyIvH+JsnFgtI3ATcJ9pZgnYC8qEQZxwQyKZZn2ChggeDpaFB3CAswi
	hBmjEtPfkGqxJakgwE170LhK2yWMYs2H+o1eQ+6M267Uu6+5pMbsVkUAk/H62/4T
	k6r9tU8eo2OZJmKdAel4UETHwwd1vvo7DmO3mgWj2jY9Q=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHWRrFyxlpztElAg--.8401S3;
	Sun, 16 Nov 2025 21:04:07 +0800 (CST)
Date: Sun, 16 Nov 2025 21:04:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: stefan.prisacariu@prevas.dk
Cc: Frank.li@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v2] ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic
Message-ID: <aRnLxcWKk5Q48y6H@dragon>
References: <20251112144441.1827336-1-stefan.prisacariu@prevas.dk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112144441.1827336-1-stefan.prisacariu@prevas.dk>
X-CM-TRANSID:Ms8vCgDHWRrFyxlpztElAg--.8401S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17CF4DAr1ruF1kKr43GFg_yoWkJFg_uF
	47Gr1kKr4xXFs5tw1xKF1kZryj9wnrXF1kZwnYgr1xGa1vyry5Wa10grnY9r13Cw48ZFs3
	Cwn8JFZ2gry3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1KFAPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAnFK2kZy8klwAAA3E

On Wed, Nov 12, 2025 at 03:44:16PM +0100, stefan.prisacariu@prevas.dk wrote:
> From: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
> 
> Make SoM .dtsi SoC-agnostic by moving SoC include to board level
> 
> imx6qdl-var-som.dtsi currently includes imx6q.dtsi, which makes this SoM
> description Quad/Dual specific and prevents reuse from i.MX6DL boards.
> 
> Changes:
>  - Move imx6q.dtsi include from imx6qdl-var-som.dtsi to
> imx6q-var-mx6customboard.dts.
>  - Remove /dts-v1/; from imx6qdl-var-som.dtsi (dtsi files should not declare
> version)
> 
> This keeps the SoM .dtsi SoC-agnostic (it already relies on imx6qdl.dtsi for
> family-common parts) and allows boards using the DualLite or Solo to include
> imx6dl.dtsi instead.
> 
> Why this is needed:
> To reuse imx6qdl-var-som.dtsi on i.MX6DL board.
> 
> No functional changes for imx6q-var-mx6customboard are intended.
> 
> Signed-off-by: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
> Link: https://lore.kernel.org/all/20250925104942.4148376-1-stefan.prisacariu@prevas.dk/

Applied, thanks!


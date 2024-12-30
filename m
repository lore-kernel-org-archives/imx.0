Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6431F15FD13
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735543340; cv=none; b=hJ4IqoxOxf+atQ+kv7HlNOy6AvuLZ3a6At472vzzJ4k+Ee+FOEMbqp6lWjMCZ5L63AtisBZrMpRQsG22uClh45vsDqjRaasUE6SzxWzVYkrN2bMK8Pgd30hq7uLTlDfwinCZ9QCnxe8rdbX2dRT97xTBJ7CE9AWjbKFdQu2eU2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735543340; c=relaxed/simple;
	bh=ejiIhZBkr+pxFjMxIZuU5K9e7hu7uM+u54Tdq8/zmV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD5oQEeeaxjN+QjlV4j3gx/7bwGShBXi5AGNLdAvPuWMSDJTYPZuDozuaJmDhvfoptjj2qDMs0S2UahrobFhGmPKOPR/tdLYWZ1vpbGEjKvBZbExwZIlWFFz6GYhtmDhXc0XNvCwEIWw0GhpNWbnRS3bqm+yrnPGeFQhR1tjByc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NETHTdzZ; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NETHTdzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ni0/JXBdNOrRusohFjRxi3utlOmJOryGodrzHL5Q1yM=;
	b=NETHTdzZPxV/6p/IBSYZ+MiJK/VNwXVHn+DM2oh2TVefCARJrwhk7stAltdKs5
	BK/4w7piqUwQxv8LUHufQYBjLoWI+vng4TvFJTPLLBsYEH4P+EHHN7hCdK/0HDJ1
	kBLOqP/vjyzTWSv1D7pxGNC5Zmd8A32NL0ce5hSSGy66g=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHbinJSXJnSekeBg--.61568S3;
	Mon, 30 Dec 2024 15:20:42 +0800 (CST)
Date: Mon, 30 Dec 2024 15:20:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Message-ID: <Z3JJyDsHSpH7jJuu@dragon>
References: <20241210105705.116116-1-festevam@gmail.com>
 <20241210105705.116116-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-2-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgAHbinJSXJnSekeBg--.61568S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry8tw43Jr48KrW5uFWkCrg_yoWxCrgEkF
	1FvF4xCw47ZF48JF15Can5JFWUua1DCay3Awn8J3yqgw1v9FyrWF15tryUJrW8ArZxCr97
	tF45X3s5t39rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08MaUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgXFZWdyDiXY5AAAs1

On Tue, Dec 10, 2024 at 07:57:05AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.
> 
> Improve the devicetree description by passing the LVDS compatible
> string to fix the following dt-schema warning:
> 
> imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
> ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
> 'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
> 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> ...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095703B42F5
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030163; cv=none; b=IT/j+U1699oUkFO5Q0xy+txNwve6Wpp5pJfCAQ9CVLUxnmV/jzJzLyT6Fc05Jxkjneo+SAwb4bAs7dzd4p1cvpLyCDs6llEk2zPNLk4rSxd7Wc/dCVzK0zHndsVRlV3IfJe+wYSWOtmskm+cg7TRfqNzisRxq7WVkpVu5fT6jEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030163; c=relaxed/simple;
	bh=ALGF0JYkp71o2WwvO7Wrabyf9hljxN/QJSQrdrlgPfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOUv7i+IvJtiM0EtXoNnVHGhHQUXkwU75/TGyrTd9rkQmCdFxALXBsAPxywt8GGNaVYl8cVACdgrwDBWmgDMVdbaIpRWvy88GaLgHZcLui/NPoCkVlK08kLsMweXMZ59HGkFmHlJCA7Gy2anyV38LzXFmSY602/2Ql2oZsGXvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5nbxjIT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5nbxjIT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b7866869so65945945e9.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781030160; x=1781634960; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=A5nbxjITK/O3580V8oXEx6PhwQGEEgeKNllxIKkHplhimcQNsihEXZrDaG1fwaKM+g
         DLKl/WjyHSBPaczB8p0eQGbGgYUDdjBJX0QBJw+LN0wpXHHVZtdsRyQso60DHzMaRkc8
         auCdw0CH5Kp9UdIBJ9jD25JD2MIZnICjjK1ViVa0ZGQrFCXnfdpM9GQudt584HD3cDMl
         elX/1kvE35uTURbbZ28szwXWFs0H+I3pumCjBpy3j45o9h2BhI2fQCuL6wmYK/NWV4mM
         5rcuPyqMjwagEnd+TDJf0HW0J2E5TugZ4P3kfr01Te43lnZiOduqzZOq3kDs3WZLs+k+
         wJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030160; x=1781634960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=K5H5MP7FQDBd1KjYuLQfg6gnP3wTUfwmyOnkONkhjeFTPeG4qBrLB28P8c481rdpIv
         sg3zVeckTQkEyhujRTePOcZLm/Fh/yU0fGEuZbb5khpgPTn8P3kWZTgAqqGDbAVCVFDO
         wJIt0lj5IkDrekqMx4vKUGFV6Nin1Gey3EyzQTD3dCVncIYR1pIpdgKwr+o/zTV2BJhU
         zpWsyWhR7NuLCwfk6y+UpQ0vh+o7g6B2Iz3IXKocs9jJSE6/lqTZD8JIiMG7cyXCFSJx
         wHBa2nHrq/wqWTf8fE0Yjse/SpHJkC9E2A01MLeY558VwvCEzdl7Xhod0sm1v/NgFPfP
         NG9w==
X-Forwarded-Encrypted: i=1; AFNElJ/l9tRh7LiJoWcA1fEWhpZ9Ik1wkeh+0e+lS3vShsznTdBWoK3gSbpL35UTe5uhBy/59Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfLZzOU45BVNlEaiVpiLW7qn9fj/b4nWAHl21wZKQIBbmNGzWm
	K9iQMyMfZxPF8hiQ50gz0GU0dBpf4tNi3QTPCtwB17+vz/G2C/XGITVu
X-Gm-Gg: Acq92OHm1oedh+JiGYyiW2ZLy7Dcj8T7reo/yfdHDBPO1/tz62TtFjNA0wSL3gDO9ye
	KkFUbI8PeA0DMzG30v87biqQW8fVaC9NPq53mDpcNzK/cThcWUxlRMA8h+Op9uc89z1lClEEkML
	TXudiKRnkOGzR8CPqjc+sb81hexWU7PMQVmhoofE4xpc5QuyOrfQOtjC/aFzeVoInKf0PuY4KrJ
	tzq+tfiCxTRiofe0pAgLdCxqn8ASJwXp/7B4cJUEsd66wrgVsk5Id7xIkPqUbWhccTPZk0GEL2j
	/xMxuXcP0JCZv3e4OHGF/1Tcc+4lHNxVTLoekE7dRK9m5VGowCII4IrqOeEAS62XsVQ8G+2ejbq
	H8IXZ7P3Do1VnJOVAxEI2W900VDE6fvrOaP4/4+v76cZRQbiqK31f5C9sEq+bj+U8InndMkiwe6
	tRCuFJrM3x1fPCD7PO5hKZoA5vtpC5npW8KDCmtqqergLA/oHpRCJ4vI+K4hO1uXfz/HBDNfAMA
	T6QTSDfR6RZJFllpPgFuugQQnIcZU+lcq40uSB0WNW3egiasVECnmE=
X-Received: by 2002:a05:600c:6389:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490c26233abmr364661655e9.20.1781030160046;
        Tue, 09 Jun 2026 11:36:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm512912365e9.7.2026.06.09.11.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:35:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 20:35:56 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <aihdDCS7LDcUELLt@Lord-Beerus.station>
References: <cover.1780998600.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
 <20260609-clumsy-material-b74a9b6bc7b7@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-clumsy-material-b74a9b6bc7b7@spud>

Hi Conor,

On Tue, Jun 09, 2026 at 05:15:43PM +0100, Conor Dooley wrote:
> On Tue, Jun 09, 2026 at 11:51:18AM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
> > development carrier Board.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> My mailbox looking like
> | 169 ND  Jun 09 Stefano Radaell ( 27K) ┌─>[PATCH v5 3/3] arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
> | 170 ND  Jun 09 sashiko-bot@ker (7.2K) │ ┌─>
> is a pretty clear indication that you're iterating too quickly.
> Try to slow down and leave people time to respond before sending new
> versions, not just respin for every automated response you get.
> 

Sorry about that. I was making small fixes and re-sending the series
immediately, without realizing that this could create unnecessary noise
in the review process.

I'll make sure to leave enough time between revisions from now on,
so reviewers have a chance to look at the current version before I send
an updated one.

Thanks for the feedback, and sorry for the inconvenience.

Best Regards,
Stefano

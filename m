Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D71A00E7
	for <imx@lists.linux.dev>; Mon, 26 May 2025 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243359; cv=none; b=K9jyGxkwvzEn8PGA1HhosRC5Y42d+ps+jmHJPCU0dRVr7sbvSIBHPiEIQfaPvZmMvVm8as0RJuOY+k7HNdgJjJw/BXQXhVTMH4lW9o44Ivyv5BhMfk370zGXvfotwtmx0ssKn2OucbELRV+zCTKeHJdwmKZ4hb1/Oj7DWqE+z/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243359; c=relaxed/simple;
	bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3bnrLiZPVLyJ3IH8c0/9z24CESyliECXzLyxYpU6oAsoLVS7ddVjnnDn/JrOmg7VtD+JZf39hfSDvT3aJGZJkD+WvCRJRlTNFsbSlKK5/ZWc8dLZBFXZ+tgGIU6o0jpCrKkq9LdYmmwKVf1Gg2ErHfpl8bH2tCa3uJwj8t1Toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNjwB+YK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNjwB+YK"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af5085f7861so913491a12.3
        for <imx@lists.linux.dev>; Mon, 26 May 2025 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748243357; x=1748848157; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=dNjwB+YKsIx9mlmuxdYlPVTrpyajP1H/U7owbJLzG/INYjV76O0tFeQUWVLGw1WGwE
         rv3naZrrTiLKkVM2PsrarTQ+wsqIgTuYn7due+LNIBeeUVoBBqP9Ha8kcqDDXUWf/xaR
         hJ8PlCWv6CuGwmczK1rS6ymnlYgOvz4xKOrHPptJ9FOf3NdAIsLW6gY5Py+cuuLBke/I
         xfjfQddvYD6KgPkMziv+KrOM2su7eJrTBA2MbusOHVBAXQ2CSZEbCWSG+75+ubfTyTT+
         e3UkD12yWBiYtPBtOKO6xW6UNWnNb2UOPIl9lZHBdqw7tHALFJ5eIkl7XGUDkLvr8odE
         suCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748243357; x=1748848157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=g0mQNDQ2CgdpDtMfMiYkVO6rvMr/TD7WJt1TK+ukEjHjhnSmXm5ciQqt2UJwl3IiXS
         4XbjMiLdu570pPB8OTbrVHhQmsc25ybRIYKmwtfaeD9Cmlb8YNBJgII2ijpn6l8K1/la
         zj08BqPtvPBA9+DhcrnCezYv/xGwUdqsZ2m3vlkLfL+M7YQy1xvDTEZ9eG/NnnFC4JFs
         HLv3GsDUUOm7Z8/ycz9y54JafHmntR/evG8o4Oh1LtzZi/7mv+gT5vAaMpehcorD2ckg
         1sjmrh7u3ii4pviJZiQYTPS6CwLzgBCOhjHd0EgyT/Mmi2pzAUVZjdKIFYpRUWcnHN35
         YLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKo+aq3K/OO81kmHsTe9INL4F/U63ziYda3gvQRHgURa7CppeYRQnpf5hWyBKEZuYYF/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9x2r+8RiMIfnyQVsqgNvejCS8EdJzK9UnGqTUf3EISf2UjGCD
	QgFnbJoMozBwh+8d4Sk2qWI4wd4TGH323khZP1YABAWH7UADMYVsoUjcMjJT1FDOhaYMpXJ+jws
	pff4fTYhZCN3pxeTBkMdcxmOrmBfhK78=
X-Gm-Gg: ASbGnctM82GS4SRTLeUrnEM9XS8aiKpswNDqeL2NSSCyFItiOSXic4j/kw3iSDl9bwk
	TcLNL34grHCH3j1Tgv1rmdIDbqDz90JxZx+Keossewm9I6F5ghrxd1kHOSFkvPL27v4fhcdA5YG
	5Un4IteMkbxL1CTrC6BXRofLEM2QD7pw==
X-Google-Smtp-Source: AGHT+IGDBhEGxaTSbxJX/MclhB7uE2CthxbT/tmia39DeSZa/GGYPMt39TPrTSYqE/n/l5Ew/IWxpQUxNJkM2ryQllI=
X-Received: by 2002:a17:90a:ec8b:b0:30c:52c5:3dc5 with SMTP id
 98e67ed59e1d1-3111108e58fmr10342094a91.26.1748243357211; Mon, 26 May 2025
 00:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 10:11:00 +0300
X-Gm-Features: AX0GCFvGtjeGuTsvrA5ltKe4oercB6wbJNzfoRXxRx6ArLhn3Fe7vBf3doOq90o
Message-ID: <CAEnQRZD+P0PhZe2snV33mvT2=2E_zHEPfkxBASVRtESDziw3-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 9:18=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> Add DT compatible string for NXP i.MX93 11x11 FRDM board.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C37224B14
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611549; cv=none; b=QfmznnNr/aDrd4aQQBud639sOaeeMdfXZ3sbVPfsoswIhN08n+0rtDp0lvzDiV+++LqOUX6r8SMXnukiUDAelvP8S5c3t4hMDsdISy7Gsng1q1vu0y5qABgC4QjtdsFOnibYiV0QGhc993IunnItoaufuiVWbLL9+6IUj5+FLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611549; c=relaxed/simple;
	bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p37YP73TDmHZEneIv0WOmxnF19iJjFhINESiD4DRbkGmzAS5ilZQH7HR/YfLyGMyxBi+/UDXwvtt9ow4lTFHw35PwrYtSJ6RqFhXAsqDxxYphB8JnK4FqbHkKUkROwe2UgGRIMMbZp469RlGYtXXHZd0JgCBFSS6rwiOn2oJPAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAFQU50v; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAFQU50v"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso495943a91.1
        for <imx@lists.linux.dev>; Thu, 19 Dec 2024 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611545; x=1735216345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=TAFQU50vhWRAXlOmmew9ali2018Zb44ujDwG6IlqpCwi2EHtCFxAVgv+cZXYB5dlHJ
         e4qJUahYc3LIYNWrInmxVoISMjE47XT4Dh04YUdZ2lzLwDrWJ6Kapyx/jh91h4tfrU00
         TJY6UkHag4J5FLJWqxCFkgUwvGxcjmcIjXohTCo9YALLsoO8tUw1WCtNK6Y2sWpfo+bQ
         SSDph7YDnmC89f6QqePmDy8dasalMjArz1MBpVh8h6nLUAuw0lwfHd2M/di4COVMWxXV
         Kmtvkgwo596CZkF5jFxqk1gioNnmengOMxWw7jm9c9DCzAocLildD3zC/ughYvWOEMVz
         4zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611545; x=1735216345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=C5Uz+u9RzxnzJyjbaKOCUwCBmw0JkWRuBn0mbl8Ow6KOUT07Av/O0bfpBJanmM6lUU
         vnwZNEIAdF/PiMD1MFuM56s+KbAC98ym75rKlipQcFd6ccC3DxuCkS9ZvxblP2Qti5oV
         fjcu4giN/OzM9eCudpTkAmR/9XXigJlImK6J5q7MdwHK+yRSf7D7Va2GIOQRvjNpWeio
         CNbsJ3PvV6zSzjdTd9QVLMVylsO3QB5dWojRk3qgGsY0Hl/M4SegaOrxhgTN8ENQBOp8
         ipjSFth+FAQ0UEEYJvgRDO8SpeKSkLa2+5OR5/8toEqgZpWEw/cBT3HSvI4tlB22LrcQ
         zhQA==
X-Forwarded-Encrypted: i=1; AJvYcCWLtprO/cdQvwU4NC5ani4f6MVpHXlfvDddsvkJ8EM3JIMei3wV45SR0eeYaWUpyWdCCSs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpiw+66W+Mr0zT59TgCAUeLU/26G7NHAD28/PHoMYalsOQg20H
	/PzVywjerRuRooJ8fLvKlVJO1rXar5PyrJ1xlHnGnh7Q4YvYwGendPCpQstxQsHRd+YqjisliZn
	kXj3o9ajHPJtQ/SdZYZWHO1hK+wo=
X-Gm-Gg: ASbGncvKGGnwJC0Nfp14gUm08xa7lqHLCyD0sGCX+rJWOaL1iITkNyYZEJaXq2R/v5p
	Fc/8Bqscck0rQ7QB04t0J3Z+h+HQtlX2+Uw==
X-Google-Smtp-Source: AGHT+IHcg5vqSpXfUTUZweqIHL07aifAd1gPNzxvvUmfB8dTWfic5k5beaD1PDMZ/x6BjXB0Dny895x/DQZ0sNv5fOg=
X-Received: by 2002:a17:90b:5148:b0:2ea:3f34:f194 with SMTP id
 98e67ed59e1d1-2f443ce59edmr4668352a91.10.1734611543931; Thu, 19 Dec 2024
 04:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 19 Dec 2024 14:33:40 +0200
Message-ID: <CAEnQRZBpWQ936-yhV2WcxzvTP3m3CNXmopt6YcawzzdZjxh2zw@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 12:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

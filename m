Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3621684B0
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765413991; cv=none; b=GkbEv5B6UscxHWRLZxUzhY1HZy3UYnEns8Zl2qQAuGmjNU/sBE/yokw1SL/MYYq0xuV485uKRzpinAE+PM9NT6WRbo7rYwVCCa1xyq23Ujj0nlkcaxr2c9Y19jMlDyg+MPDt4P2AgK8lU+idePyga7Yntp8cJ0L025A3Pdg1x9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765413991; c=relaxed/simple;
	bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDc3N7Bo8+2ocrLvqvS2MOkEtYuRNNQCw0rSvQHM8/205P6ZNczk8Ap3h+lQIWXpVDR/HK46ylpaxGanxR1wRcyjhb57di0tv5hKciaFyRJTUzIaEHfKVyR7uanZqlcEhOytILERb4ciwhGQvHRfMV7f2q2w3SvD3LOod0QqYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEP6/9e1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEP6/9e1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so370667e87.2
        for <imx@lists.linux.dev>; Wed, 10 Dec 2025 16:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765413988; x=1766018788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=;
        b=cEP6/9e1zYLvZBTtRUMlAU5I5EDM7wp77FDsFZS/MsVdzwSZZTVhCocLcRSF67L6iL
         WAWhgTxq0sMcpSgwGkoLsXPFwkh1qz31pAAtkULwE+6gpx3FtRq/+H69N8WipJ2mJpTV
         o8PHmzaWwINqYQ2v4ruYmL1uJQU6X+ElIKqlxroCJw9DkdxUPgL4Bz3LJHE4iMhunSb6
         ApXVZnex9CsxBjouIcnij0RO92+0OEi7z3rTivRv4tWsccDJ8U0zHIRG9jic8wnFmLQG
         z/UpWjpUHNGoWVAqAlnfgbz88P+h7LSGmNlZyaiaHxHiykWsHVZaCTjStMdLW2TkVhAV
         bqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765413988; x=1766018788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=;
        b=hV+mDTc1xVcRO7awfbTgeOJ4LGkp8ldk+N/7CuTsJ8Cm8MCXtjnG3lcWSSdhGw5h+K
         5gV23jOMqwGHJ91wuzHDn2+9NmmiTMe8xQhq2ty3Pl6ciQHFFcHQHmoTeaPkYjL290PB
         e8Kmj/i7BnvzDAjfMVy188jL5hT8MqjfNMHC8fY6UDP03iwYPRCh14+Mea1MR6m0tp/k
         +1+rIRKs1UxLw7uPoIaZuNMaZzJRc56ohA63lET575Pag4gB+iW0th+GzaxRnZhowSIw
         6xkczpyLmh2z+sSbcxaR7TFD8Rwu5CJVrdsKQTBbxbxK8DR/RVg8V3c43WI0BAmk+j8f
         bXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCT/tPqbxC1k7IDkXZqjqxlk4D3dw//tXENNKx1y/qhlmZY0VhYet1nfjaA/Aghu7hwws=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4EEvtmf2mp91C6pDR4cuBGdY1qHuCby5l9MAJKSTlRYYRg2Ue
	dAs3rYIHUOlZ8me0+P0kFxNZXpIr6Pj0mVCm+OciDNn4WlO75IQDBzK5xQCKTuFpnNfW/MdDS3u
	WDf+EO40l0nqVVXVMnivsNH+MjNyzI3s=
X-Gm-Gg: AY/fxX4TzKNDmeRkMs5HHmgXC4ZZerDZR6iD8AOblWUyXYJ+onZKw8Nq2MSHIg9fsz5
	ojSXmBlVQ3NJglUh2G2swtaHUNev3uW8XfkOQm/ZvcBdnPdwDggc2/QdFsV5B245k/vFMtnfqXZ
	z5hiBX47Dl4DzFm4QqRf9+W10Bnb/6AWc5VPHwMVLfHv6Gpi+2nClgsHHIDOZByeg4jbTA9bdG4
	XCkfOVup/ya/6SFLPh5rVfzPdM5yiz3SqiDsD5LOc+sF+qrVf/Qv9FuLs5OeWcj5f+36iLe6I/l
	AKnMaswOgLZqvcHgh2N+kcQFLsR2+8jC+Y+TYA==
X-Google-Smtp-Source: AGHT+IH6NbxkTUZSljGL5UXTIkr6tHBMYOHOGf6OgfMEP2fzi2rZqXy88k3bhBA+yI5GG+va9k8Djc20ctoHh43XOXI=
X-Received: by 2002:a05:6512:3c91:b0:594:546c:431f with SMTP id
 2adb3069b0e04-598ee4bfcc2mr1798313e87.49.1765413988056; Wed, 10 Dec 2025
 16:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251210152000.42265-1-stefano.r@variscite.com> <20251210152000.42265-4-stefano.r@variscite.com>
In-Reply-To: <20251210152000.42265-4-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Dec 2025 21:46:16 -0300
X-Gm-Features: AQt7F2oJTNhQYHQm4Mp3X_RNji2ahbbkHznpjmov3J1DROZAGzAUDzZ2iEMc9-U
Message-ID: <CAOMZO5B2__4qgJRni=DPxd1QoPQLwO+r9ZbdbsOWXZemVU86aw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] arm64: dts: imx8mp-var-som: Remove UART2 console
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Wed, Dec 10, 2025 at 12:20=E2=80=AFPM Stefano Radaelli
<stefano.r@variscite.com> wrote:
>
> The VAR-SOM-MX8MP does not include an onboard console connector. The
> debug UART is provided on the Symphony carrier board, and customers may
> choose to expose any UART controller on their own carrier designs.
>
> Since UART2 is not populated on the SOM, drop the UART2 node from the
> SOM device tree.

This change is OK, but you need a patch for
imx8mp-var-som-symphony.dts to describe UART2, right?

Otherwise, people using imx8mp-var-som-symphony.dts will lose the console.

The same applies to other patches of this series.

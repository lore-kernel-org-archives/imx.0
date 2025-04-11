Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84E268C48;
	Fri, 11 Apr 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403224; cv=none; b=KnJG7QH8GOL8Osktcul49ZIDUW9P4qHZnjEZIpKzxI86yG1Q2tnVo4xfo9zYbgW0ZlGpnf/eiwItDQ9daqnETQAPhqB4DaHgmCALbz5xqjGAsuyJiXmz1JIRwEf3uM2jMPwKrm8szFkexIc0RBBEXMfmURMf/NlsGYtTQrejUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403224; c=relaxed/simple;
	bh=0db2ZvvEaBiYWW5dZn01u/FW+dk6clupic3ccg4s29U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWv/GVNR7ICMiJ5IYQ6k3L94cN07QxKTG6+DwGXNezJR+PTrPD2AMNoU+QHeoVRJFozlV8plHZePu0wKzVTcG+Df6t/yXG79g9FesGDHg/jXAdrTPyar7g74jM3g56frYJfoNAQ1XIa9wqc8gAh2dA/MFFmbjf2LVcLk06v4Bck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esDdo68Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esDdo68Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D289C4CEE9;
	Fri, 11 Apr 2025 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744403223;
	bh=0db2ZvvEaBiYWW5dZn01u/FW+dk6clupic3ccg4s29U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=esDdo68Z+d4Hv2xTg9bir7moDVY9WA5ZHNQOQQSuaSqpK4ZVZ5TYCII/bn4RwxMZr
	 v91Fy4ZOoM0+/Jt/kJz+hHTDBH5Y7cgorkg7hKJYfMEaAtyYm0yo7TVsyLDYP8X8Yr
	 lbBolizfkYoMybinoxMnQeO4z15ssNsGWjbJWaCNcXXhLeL8+wXdXh4bxQDVNpBy+W
	 16U0UR3T/W7DwHyxqusjQCSezbEnBHt3oAODHEOXBlDZ57rr7uw2sGTGNNSPwztmgs
	 OP7R18BP7Fw67uyJpytSsPPFA8F8LJPW2roAjchwrwdUeX0R1tYzq+HQy0G41GmtXm
	 oaWZ2H87kVc8g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so3674222a12.3;
        Fri, 11 Apr 2025 13:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMCKbOBWUY5qNp4KZOAEWj+Eqpa/BiyNXgAsY3vxFyAhUpI20IFhBuPDotYrlvjlcsqE7LeNxtpVyi7UU=@lists.linux.dev, AJvYcCXKAWLTfhoM82heKtqgOJt8+LKLKJefou0fP168jYE/lVxgiup6Qlka7LX1ZE7YSmRTSyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXakkEPd8Y9cq9kABePRBQ8ZZYjHZNIsxRksg4u1widhOajaxP
	s41lQZcmneI2PFU0YkxIg4eyod5oxDtTiOd6Qa3F22o2AGlFKSatXGZNzev1a4/pCjHVXke9omQ
	vqZa+Cb2is9Naw8779PeSn3ybyw==
X-Google-Smtp-Source: AGHT+IHTq9IynIF/z4Ryd9XhwviquzTS623VvUxbOB2plMDWlWmVxnnGmioMBYPRMrNx5/qrse/N9OEq7aX0hV7vQRQ=
X-Received: by 2002:a05:6402:1d54:b0:5e0:49e4:2180 with SMTP id
 4fb4d7f45d1cf-5f37001322cmr3235456a12.25.1744403222033; Fri, 11 Apr 2025
 13:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-3-63d7dc9ddd0a@kernel.org> <20250411-ebay-exerciser-392c42daf5ba@spud>
In-Reply-To: <20250411-ebay-exerciser-392c42daf5ba@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Apr 2025 15:26:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJza-bufzjZ415THyDDQaOfk8F+JRFvFxzNwObG=NKVJQ@mail.gmail.com>
X-Gm-Features: ATxdqUHjYgk-N2yFwfhKqPvFMPb1Jj4TAQ2QQ1AYg4EXz2sFdyWD0eKD2bEivlI
Message-ID: <CAL_JsqJza-bufzjZ415THyDDQaOfk8F+JRFvFxzNwObG=NKVJQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] arm64: dts: microchip: sparx5: Fix CPU node
 "enable-method" property dependencies
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 11:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 10:47:24AM -0500, Rob Herring (Arm) wrote:
> > The "spin-table" enable-method requires "cpu-release-addr" property,
> > so add a dummy entry. It is assumed the bootloader will fill in the
> > correct values.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> > Tested-by: Daniel Machon <daniel.machon@microchip.com>
>
> This is already applied, guess I forgot to merge it into the branch that
> appears in linux next. I'll do that now..

Sometimes I check next, but in this case I just looked at replies for
which there were none. I dislike submitting dts changes because it's a
range of AWOL maintainers, only applying around some rcN (so up to 2
months later), silently applying, and applied but never in linux-next
(until in soc tree).

Rob

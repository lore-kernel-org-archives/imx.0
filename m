Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6113A641D;
	Sat, 16 May 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926140; cv=none; b=QdNyhOh2ACpwp8+ltUWhCZZ8S/FaTJJeTu63R0ZL+Rq6/dJna58V2ywKNj/AHFECOZgGztCEsQXm4zlAh9NoUYJZBaIBnZ415MWUpKvJkuJSulZIc3U5f67/k0yxJDvaK46sw/0gSXqP7LM10qwQGZg1wIw/ug2OW/q6q8Jst9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926140; c=relaxed/simple;
	bh=tK/PjsY+ca4bXcbuVRqx1ubV83FYss85Tnzac0XGR/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni3xRYIpp93Z1bC0RSpTGkjBcVYdFrC+MxElnwIXODX4uJJ6SCuVRAqpja3r9JPFYzp5b6e31LzEtbQe9vd+v8SgxAvbmQOHNJwkiNgpcD6MJbI5iLcxCC5NwFdOnL/7H87lVQWIBINYD2wq6Cqs8WqUc47EcIwcxB1gpNAr+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7QGVZNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7QGVZNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AFCC19425;
	Sat, 16 May 2026 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778926139;
	bh=tK/PjsY+ca4bXcbuVRqx1ubV83FYss85Tnzac0XGR/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7QGVZNcHqc2X+g0gMwUWsvvlmc4Xh4NQC0DHkaAohtVNDQOfESz3dwiiiU7w37yU
	 akpANEgvEb477O7r85E7H/vYws9sSy1HBhyj2/LCLTM0tDXyf7s6epONf9wemVdJeX
	 99CeLsN2mVQn8/3iddL84Uk5nTbNxAPgAff7R95Rn/30mZkIMGW8Fvw41nzzfvzJ2o
	 fXxUAj7NZagsp98NH5q+e/RqC/TZSAsBuMz/4XnAmwngL1E/DWMM5elNA5C2asxF8w
	 LaJETZgaB9EV04cQzGJrvnpKmQELbGQL42pqzkNL1J4s1+YI4CpvVnP6LeoselwaBV
	 IeA3jTPnyT++w==
Date: Sat, 16 May 2026 12:08:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Frank Li <Frank.Li@nxp.com>, Wensheng Wang <wenswang@yeah.net>, 
	Brian Chiang <chiang.brian@inventec.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Antoni Pokusinski <apokusinski01@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Message-ID: <20260516-exotic-modest-gopher-8e8411@quoll>
References: <20260515163959.1948799-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260515163959.1948799-1-Frank.Li@oss.nxp.com>

On Fri, May 15, 2026 at 12:39:57PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Add freescale 2.4 GHz IEEE=C2=AE 802.15.4/ZigBee mc1323 support.

You did not add any support here. Also, I don't know what is that -
ZigBee device? AP or gate (whatever is there in ZigBee)? router with AP?

Plus more important - why? Where is any user of this? Why do we want
this patch?

Your commits MUST ALWAYS answer that. I already asked you that.

Best regards,
Krzysztof


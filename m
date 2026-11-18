Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023799;
	b=NwnQlMb0I9rEnSnRwgyui7XOc2D+MjK4tsSR+62w2ysXbNwkqeNYb2B98TGTpOFUTnHH
	 fGiRK35dPWDxpO5TXc4Kto6XlMxXv5MKuEwfXj42nq1UK9an0eLiTyN+4mY/0jG948HhI
	 QawXyQBxssmiNvcHoDmAeYDoc0ua3qg+DKVbWA8a6xOEN+Snw8qUxeiAKsFfBKTKYSkML
	 NvNgyeIYoxo9z41eQahHuyQSDtt6MxRwrNm6Cz0T5tlnZDpBaMd72YyAoXd9mVFb8RtbF
	 i4HNR9RIYifIPcMGy63Qw7in5qkq6hI0LiMDfjkgqy2rhitUXmMFOtQld93Z8ZkM5JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023799;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h4QMDbUlLK3JUINWeKESKCeRq95srb0V6n/+KsapBSc=;
	b=3sl2Oq6lROCiWZpSGnYe/VmVltG7yzk8Y/qV178EIgWGflNhJP6Xu7vAEtkTkTURkNbW
	 Hug3r3ohz3ft+tlM6kdgKkD2WroO8zq/db23N8JbyOvC494ZqccN6+OmI9h4NhelAuIrM
	 4CSXdXME6AJ8GUuBSbK35xnqiKaDxVqIZwA+1e7oy4bTmJncAMiq0iGs1hbTZgk4CgUzs
	 5OwhcOBhuTdfWa0YQMVbOZQOm7hCKYwf1pL+tOJy/K8pnqlTFMe5g4MY/U+IWxoG9Qw9E
	 8i4BB02CAGJ/mpKiWQzy907QEDk2F/DKr05t0E/JYDemjig3bgmZEdPflax+jyrSsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cY4p43yP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569B606A320;
	Wed, 18 Nov 2026 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cY4p43yP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED1D1F000C5;
	Wed, 18 Nov 2026 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023799;
	bh=h4QMDbUlLK3JUINWeKESKCeRq95srb0V6n/+KsapBSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cY4p43yPefX/HBKL6TjrjtUHuYJ4QnnCySmhlBFjeqG8ov14mCuA/Fb4r+Rp4uBys
	 KQf110u520rNQ52eRjt7lVv7GgqxYVCexEI1oFWRh3R7JQ5kiACUEfwbxL/ALVxs7E
	 h0A5YY+LJ6brEOtRM5TajyXxNFQ+p8lG032HD3dWdL9Xq6+l/u5PMT3r0doyW1f6fa
	 JRg5CqPxOnVTbWBl43Y/gTIGXggI5AD7d+Exqsy3G4TFl+j3LjDcXSdBXpN/1Aoua1
	 mxZ8cTE6OqM0hF7jiUfyfpcbXljT4EUIupPBaOlzzXZKx+lFGV08FF4dzBTgHcTonH
	 MnBmzHjMRnH1A==
Date: Wed, 18 Nov 2026 17:43:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: nxp,netc-blk-ctrl: add
 i.MX952 compatible
Message-ID: <20261118-pregame-rewind-adc190f20a68@spud>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <20261118-imx952-enetc-v1-1-25721440602e@kontron.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZboeZI2tSg9z9ktg"
Content-Disposition: inline
In-Reply-To: <20261118-imx952-enetc-v1-1-25721440602e@kontron.de>

--ZboeZI2tSg9z9ktg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZboeZI2tSg9z9ktg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3jsQAKCRB4tDGHoIJi
0hywAP95LsFoC6lPGGQcWm6d2KifeNnClG7i0hH1uy0Zvf7iTgEAhYh7qfn8K8cf
1kr+T+6zQbKxWfJWtVJFggSBBx0eDQM=
=ddW2
-----END PGP SIGNATURE-----

--ZboeZI2tSg9z9ktg--

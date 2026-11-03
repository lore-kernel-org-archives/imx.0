Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706047;
	b=kBMtvt1EmYH/Nor9UABXvTteTF9zWg1W2FHy0ifak8vSytKvlHRjAhQxlsF35LjWXxt2
	 WHgLR8mFrDvoZaPbjqVOnYYenleUtNJZPuqYr1VSiFA1UnJb8oUJML0/ARhS5yeeS+sDW
	 hXcxhbf5bc+1KN3Z3xa8bf1s6sMb89jGU/qgMtgsdluHLhjpfGTnD9ALElUNnARWvKLBT
	 DWWBo1IqjqJwkc9C99pytAWQXTO9NHLImYZE9Gs7QmTU7iyRo0zs0J7WC256iQ8xclo5N
	 I6RlD+lU5omUGK9EuEbCN+ljMdNc3ChHdAxKmbJ64R7peRrbtQ9gyjZgcOBbnbDyGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706047;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rHkwO/ehoRHtFtlIGsgdWec2aBhEIACUFFPzSgEDBXU=;
	b=bDMrhEZkEBH/0zBrZMydbySD0JYnFtPXoxDNR8RteUrGMkmB0hiakXF9UkcY4okItTKZ
	 0Ar09AeFjTM96TFZ6lhQeiodg/y1cR7kR6dk84DsPOIg+ipC8rPOiLt9BnbWzmdMlFJtO
	 68YPH+y+eRtvH76dV4PQVFp9HNN4ycxcXR+0cwjen92/9ptGeNILJqH/5EGWAGvqsC+vY
	 wjXA3Bhv3B0o5JDJup9Mf66vtLEnysH8DprldYwxlw3pWbHSyMFAXAdowbve3jaDMY4/j
	 Gjmn+IAsHC1XQi4rkWuD1bLRV2jw12JP+E8SjR7MkMyMMy9qapslv61AF8tQJPNtMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xb+/PNN2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E1606D809;
	Tue,  3 Nov 2026 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xb+/PNN2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C271F00A15;
	Tue,  3 Nov 2026 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706046;
	bh=rHkwO/ehoRHtFtlIGsgdWec2aBhEIACUFFPzSgEDBXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xb+/PNN2A3PXzPdA5kV6OkdJPlgGA5VnLHEUq0A277IG4azvN+aga3fbhe5yeak7g
	 y/RyUz0c5Io2RBapuzSdnFG4K19xcw+pSL7M1jn3KNEeBpB03yRYupFVsOfM86U8XE
	 B+nBvqX5bU/xaAJe5wU+7/atPF04UywRS/x+DoUZ8I94wKEr2yKb5+e92YX/9nX+VK
	 nc3X9KtRQZuD64i+4fQ8CMc6Qu4pzf5lE0zzIs6DOCytgV0+TMg+uPnbZ8KQSyr6AZ
	 lecgRpiV1SKsxTubCU/0UvOByAH+PNdqSiAP23F4feTrkT4Urj+CD/ruhw7CQ+OpXg
	 gXWGdz7Cic8Jg==
Date: Tue, 3 Nov 2026 12:40:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinesh kumar v <dineshkumarv85@gmail.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	festevam@gmail.com, Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Message-ID: <20261103-bouncy-upbeat-civet-d85994@quoll>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102102653.272056-2-dinesh.v@adlinktech.com>

On Mon, Nov 02, 2026 at 03:56:51PM +0530, Dinesh kumar v wrote:
> Add the ADLINK Technology Inc. vendor prefix for device tree
> compatible strings used by ADLINK hardware.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Also, mismatched identity/DCO.

> 
> Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index e467da45cd7a..6bbfa5619ee4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":

Honestly, so difficult to put things alphabetically...

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AE2E63C;
	Wed, 11 Feb 2026 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770778708; cv=none; b=NjoSEkz8BNwlpe+4balMFV1QTdPxe4IGk9WjFehXvAAHavc668KlWAdMUXd897wLDgLEX2L3evtuiD7zXP8IrSTrGSyfyQGNMNMnBbv8GJNHbd6avQ6RD4doy0Ze+pz1x+DZqsjVK9e9SOXo15TXkaOKxjZOrZuNTktD8ebu57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770778708; c=relaxed/simple;
	bh=47DLy2E/pE4mMgLkV3NBSaU1iasX5Md/6xrFknoO0OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1ioZilbCHcTn1/oBD5iBoCS5x6D04hE3LcPbxPWHXtBlYu1Laiz+eJqO7EHjfoBJF6fkzsStipDBxFi8+hwGv3x/6On6HwKi0t5ZtYXRQRyr3PpHa6NmxmXHy7zvWsngPr4fgORLdfoVpOWDLdQGGkmo2jZFl/+IuZLqEF6d/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpMnlnpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpMnlnpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42401C116C6;
	Wed, 11 Feb 2026 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770778708;
	bh=47DLy2E/pE4mMgLkV3NBSaU1iasX5Md/6xrFknoO0OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpMnlnpgkwZyEti2wwgLt/FWYIDnefFl9KknN6f3xG/G92wPkyi1j/9SRZ5R9f1hS
	 WZ/2efcXg51UDbgZMH2HaWO6in5JlDkwbfboQQlJLE9VD2amCBjFhg44pr3u1SJ4Qk
	 bliLnG88fKZiDMKIf6rzUiqa1gkhkktMhNrFbZSwFjELcYEhYuFjFQl4dEPd7JSS03
	 VqetnZVo96aXap4JJKc42kEkv0G5rxNioJqa0wsAd7OTRrYjI6lhD4Qqy32qNIdCyY
	 E0KbZfssUsBV6V9yg8H30EHTQhJBvexisi1kQcNiPSVXNlvI0Doo6/1jZNQouwxkQs
	 CZGoBETYjRWKQ==
Date: Tue, 10 Feb 2026 20:58:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add
 compatiblie string fsl,imx(1|25|27|31|35)-avic
Message-ID: <177077870687.3555154.195306926259773612.robh@kernel.org>
References: <20260210221215.1575844-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210221215.1575844-1-Frank.Li@nxp.com>


On Tue, 10 Feb 2026 17:12:14 -0500, Frank Li wrote:
> Add compatiblie string fsl,imx(1|25|27|31|35)-avic for i.MX3 SoCs (over 15
> years old).
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add imx1, 25, 27
> ---
>  .../bindings/interrupt-controller/fsl,tzic.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Applied, thanks!


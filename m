Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFD309F1F;
	Sat, 17 Jan 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768634671; cv=none; b=R8tzQwSfy8qUQAOV9c4BHvWq0eHzGhIiF3UVCrHMM1H2o8nplu42tT46qSUs/KDKxPgCQm3324mhFhgICzPQFz54u2fbfWf4NYNFx/viKUBxYgB/5JsmXR7qH3OMHkaV5RuRIe/AHU9gV3akruCA00Ctphq8lP7sBxj26ab6oCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768634671; c=relaxed/simple;
	bh=kQ+PwSYBZgJw8xmRPS4CRiAMmUyORi+7+mylOQXpKBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqibnGe1BZvmAaoud3bEZfukjysMJngPG9aXiiuZe9NMa9HKDVry9oL72Ow0B0jeSOE18+IWDBNGtkpLPGHkaVVyDO+DcEpAoTlJULWwYeYgCkc2z2HKzvxyyL4fEi3Nan/tNFAqOsogD40R4OEk0rbjpQSErYGG5lKpQ1w6qRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KofW8/93; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KofW8/93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7ADC4CEF7;
	Sat, 17 Jan 2026 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768634670;
	bh=kQ+PwSYBZgJw8xmRPS4CRiAMmUyORi+7+mylOQXpKBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KofW8/93lpPLKInknOsh8BnRBv3xSZN4KpOq3+PFg8hh0ksqLYWbfo9LRqA9ABT4e
	 61I0Ydnix2kTOq5UG4RxwE502SeRO0Y52W0xj6foZgqcmARtm/iCcmCs/kGEoDLQVE
	 nWpXltdhl6rFbfHnKjxlP629ax4Pu4Rd4frogJg1B+sS9ZD8/6/DgYPDdUcPNYLfES
	 ZQgXb5LAtOpNO+5bCNqzEZ+CuuXRxcZ9ugHx588xUXViaxSY/iTo6E31XURt6hM+Ul
	 1C364PGUlwLYLsBuxu9zGqHrVMOXDhCUvd8rlWYSQOe1UFKgu1tc8O3WD1+Afy0LXp
	 rANCdYzWXRNxQ==
Date: Sat, 17 Jan 2026 15:24:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Document ifm
 electronic gmbh
Message-ID: <aWs5KBf-ur3fOBVH@dragon>
References: <20260106190147.31924-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106190147.31924-1-marex@nabladev.com>

On Tue, Jan 06, 2026 at 08:00:37PM +0100, Marek Vasut wrote:
> ifm is a manufacturer of industrial sensors, control technology and
> automation solutions. Document their vendor prefix, which is already
> used for ifm,ac14xx and other powerpc devices.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied all, thanks!

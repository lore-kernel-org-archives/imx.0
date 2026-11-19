Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094618;
	b=DmTQ1e4tY3QQpdbS/fQJ93jofpzo4PkRiLoHdJrMd9P9cdU/GF2AHtbYuy3O5/EuRDMe
	 vbtNoP37onqpqljjevTOtrp1PAH2HD2JXlVLhBkz5KlS2Ehgt7XalPwhDMid6QWYlEBEy
	 2cvueoU2Bxh0lNuGScy5eAtde/F047oKqSVX/WfmEiE/QCzaG6hJ2UuCrY+vrJiOd2Lh0
	 OW+I4fqJnLm8KSi8PoMRhtMW1nsYYZMdQHev7lWcTy6KWda4/ydj7aYGJ3NXaCPv31Lln
	 AvJvN83U7mHAaMHaFqsrYKPuOBxb7B+eE3C4YW3Qfl+rMvx5MO1a3siFLLmuNxeoSug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094618;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EdJiYgwYCIOqRCeOsRL6qc7Qjf5vSU6CS4yY2L/Kemo=;
	b=g56cUoLCi3308aqxiht3IoCwlMoyaepEmG+64bIEKq+n6910EEVTegOhwbJjjBLcTDzU
	 sH35K7Gs9ABOy3cARKozRdFoO9HG6oUW+3tnjfupP6c4SXeCnWAwrIPijONEDniEJuC70
	 qivnXMZwwqMoe6qxRxUo5NBm52OpJ797VI6kgNRY0J/iqMrH6Uij12zLDcokWPK4qL8/1
	 ggrU6o6k9gnHZ6tQio74+r41eUCuFSfTdJgzxS+cRT3Jclh8CT8ugFiN20fGWHR5hT50S
	 S7jFWQA0/kuYKWGoKAwhNyRwGugc8c271NSGDi4CdlnA9nWKF0stZLnM9rOoGnVXs9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h22m5vpa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B1606A32C;
	Thu, 19 Nov 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h22m5vpa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F7D1F000C5;
	Thu, 19 Nov 2026 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094617;
	bh=EdJiYgwYCIOqRCeOsRL6qc7Qjf5vSU6CS4yY2L/Kemo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h22m5vpaAFhpWYESjdJo5TWWbFQiBb2MHNRttY1A8wadKyUu5XELL11MRmkvzXU7m
	 ESWUBRIhDgi12YRQF4aFSUYEEb2/VvU8laltr/ejve/QiJNhEQYeehvGZLDScKCDGy
	 oYBbEw6K+a0SRbRzcaIURCP6nW0xFF36tKVwPE1EJ3keavP+LpxI+3dwEgTOfsT6G8
	 fy8hloUmXkDqzg0sLAnq2r+1W2QWqyFNbHSBSifQku9A7FZWh+JDTYF/dvH2Lyhwdy
	 5AtvvTI+1m6UBVvUkXl+OQPjnCEt6XAoM+4empaQkgu5vZRT/3vAqarX9PdQ7OT13G
	 Dw9DKxO8OIJ9w==
Date: Thu, 19 Nov 2026 13:23:32 +0000
From: Simon Horman <horms@kernel.org>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: netdev@vger.kernel.org, s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Russell King <linux@armlinux.org.uk>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/6] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a fixed-link node
Message-ID: <20261119132332.GV860048@horms.kernel.org>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
 <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com>

On Fri, Nov 13, 2026 at 05:02:32PM +0200, Claudiu Manoil wrote:
> ENETCv4 has special internal links when connected to the on-chip NETC
> switch via internal switch ports, called pseudo-MAC links. These
> pseudo-MACs are proprietary, they don't implement any standard IEEE
> interface (like MII), and can be modeled as fixed links with the link
> speed determined at boot time by the Port PCR[PSPEED] register
> configuration.
> 
> We also need to be able to probe the ENETCv4 Ports featuring pseudo-MACs
> as pure PCI devices, i.e. without any "ethernet" DT node representation.
> The typical use case for this consists in a board with NETC connected
> via PCI to another host which probes the ENETC. Note that in this
> scenario, the pseudo-MAC ENETCs are connected internally to a NETC
> switch that is not owned by Linux.
> 
> Since such a port has no "ethernet" DT node, its fixed link has to be
> synthesized at probe time. Build the fixed-link subnode directly in C
> with an of_changeset: of_changeset_create_node() adds a "fixed-link"
> node onto the port's own OF node, and of_changeset_add_prop_*() populate
> its "speed" and "full-duplex" properties. The changeset is applied with
> of_changeset_apply(), so the fixed-link node is spliced onto the ENETC
> netdev's fwnode exactly as if it had come from static DT, and phylink
> picks it up through dev_fwnode().
> 
> The operating speed written into the node is read from PCR[PSPEED] at
> probe time and mapped to a phylink-supported value, so the fixed link
> reflects the actual boot-time configuration, as long as it's a phylink
> supported value. Otherwise, PCR[PSPEED] will be updated to the closest
> rounded down supported value.
> 
> The pseudo-MAC path is selected when the port has no OF node, or when it
> only has the empty PCI-synthesized node (OF_DYNAMIC), which carries no
> fixed-link description. Ports described by static DT take the regular
> of_get_phy_mode() path instead.
> 
> Building the fixed-link node requires the of_changeset API, which is only
> available with CONFIG_OF_DYNAMIC, so select it. As OF_DYNAMIC itself
> depends on OF, make NXP_ENETC4 depend on OF as well, rather than force
> OF_DYNAMIC on without the core OF code being built.
> 
> The changeset is reverted and destroyed on teardown and on the probe
> error unwind. The node-less pseudo-MAC path has a runtime dependency on
> CONFIG_PCI_DYNAMIC_OF_NODES: that is what makes the PCI core synthesize
> the per-function OF node (of_pci_make_dev_node()) that the fixed-link
> node is attached onto. This is intentionally not a hard Kconfig
> dependency, since the ENETC4 driver also serves regular ports described
> by static DT; when PCI_DYNAMIC_OF_NODES is absent the PCI function has no
> of_node and the pseudo-MAC probe path fails gracefully with a clear
> -ENODEV error.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Simon Horman <horms@kernel.org>


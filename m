Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BCAD5E
	for <imx@lists.linux.dev>; Sat, 22 Mar 2025 00:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742602080; cv=none; b=Ft5H9ZYSt9v3OAa96qj4lhkHTjP+bOPcDJSbaEaha9x015VvSMubDI2UkiobEivUlM0cNpL2wJtrDSrqjM7f7YUhZnqo9RgzPpnLWledFmCnb5UI7dJtachlP6UgI+gZriQPQXfGHAfoimYr2Ui4PX2NvL514F0XAtJayozA5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742602080; c=relaxed/simple;
	bh=3QKaKPMSJD+/egJfzRapWYRtqycA3II4RLMgHhqVCHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKH+msKvgo+KD57166x/pTR5UeVPh5Z8wAc77qJ6F3ysFzLbvsTAWETDZ0nAxsFk+KRh+oZjWwhngUldAGjELt+KpeljguygRLZGzRQboiBlmkffdYmWWbHry+kUq7HaDt/DK6dtk+TuXBzIzvFUy6s6HObN1AtILo3tawhIdeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK1HRu10; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK1HRu10"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2264aefc45dso27365695ad.0
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602079; x=1743206879; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EXV+liqXecF19/95E6X4B8HYwLOUANKAp4Chr+5IZE=;
        b=TK1HRu10zKheBz/y3YlQs0Qe3PSUM/UkfwjRWSUYBQgDPzUaewogCWjEgXJuYtiUAy
         4Gi/XA8/6nhZjup6jw/NR3uPQPKfBqs4cUfJntVuX6rbX4q2fKRR2LONLvSmybd01hy7
         6RqvZ8o5MqYaGoajHQuB/mTgzMJNFU2jGrlhysuecrE9e0btqikXnZjJH4rJcfq7WI/b
         w82mITEalg1sNucIXs5s9Da2ccWJP4mLNyn3FWEHpbZVG3AXWuD/dQdlCmUP1WKPOAAl
         cK5kAc0BK5bScdl+YIuQvnDwZGDngch+XLM2JCZSmXuZUOWKXT1RgPh7kjCLQX7YM3ju
         IeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602079; x=1743206879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EXV+liqXecF19/95E6X4B8HYwLOUANKAp4Chr+5IZE=;
        b=AvlpIo+7y+yYVGssEGSLM2pXhplLw3QI/9jdDPWDbkkCNmaNU2/qS+L6iom92HMxEz
         oO0uMUK81THpmOY4OyY30CKeVGBiO9O2ZgYJyFmXmo4Rq8weXrpNFnQaES0y+Pck71C9
         pmwKaALXTQBvk+Z9d5kqynh0B7sbaeCQfwPtWCI8MT1xnVbAYpbT6W8gwc7yf8jR+BX+
         adnlOISLGxRn8vrvyB77pWimUtrMF04EtKgnBvy0ff9tJprDfxniHOclTnsZwGfyctjx
         z3xK1O1xdpmsyGb9jcuLFS2b6R+pcMF+a2j+h0JyC8rhUr//7wfQfGV6GOJqNiJMhYkJ
         Rnbw==
X-Forwarded-Encrypted: i=1; AJvYcCVF1EUPmQXCa1kbTsBAF6BrNh6xif+8NfKwBGHBR18/iRU8XIE6IHZS7vxIBDprUhwTWPI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze6YcxgtGDF6xOn27EYjKkavCT5/6gLVSUDDimqqegTVNOq6P2
	tVnG0P0n4oRy6rWhJKW1hyNiMT/DNzOgdGXyvWkLngZuWNnbuYNZ
X-Gm-Gg: ASbGnctsbKhPG/xt63bI8eZqbtkmNd9FaseAvPoiPMzCpewgxDmcgpdMnLvX5+k7zty
	NcAY3pGj3b4A4J1m8QGF0grhj3mxk6HkvqctSiJrulAJBG3HnYyVtcA6c78SfuHbaQ5Bw4qSpQB
	7bTN3RFbUxhdXGNeC1ndMGOEqovuWvRWGJ6/WicFaHTzxgk6qMqua+b1Sm/TztJq4eJHXYASbqR
	Ey5HOUE9UOWhDZti8QE3hf2ECiglWusDSqBheu4y3GVjCcblUPZcaHQ7oD2I3zne8Be3Loxl60l
	MbzMMlevoWZr/yIBtmE4/6bcL76iXI06EpwE7WVkmKBgoSCmnJXi11sgSg==
X-Google-Smtp-Source: AGHT+IFG3IzHoUnF4Irysf7rShLOoFBmDOITsQx3iVCYXu5PXAFkhXgqbngY+idRPjClaq9zGMWhOw==
X-Received: by 2002:a17:903:32c3:b0:224:1774:1ecd with SMTP id d9443c01a7336-22780c5599amr67690555ad.4.1742602078632;
        Fri, 21 Mar 2025 17:07:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811bd143sm23906575ad.150.2025.03.21.17.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:07:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Mar 2025 17:07:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 3/3] hwmon: emc2305: Use
 devm_thermal_of_cooling_device_register
Message-ID: <f9982a05-5104-426d-b9ac-de4b5c4d465e@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-4-florin.leotescu@oss.nxp.com>

On Fri, Mar 21, 2025 at 04:33:08PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Prepare the emc2305 driver to use configuration from Device Tree nodes.
> Switch to devm_thermal_of_cooling_device_register to simplify the
> cleanup procedure, allowing the removal of emc2305_unset_tz and
> emc2305_remove, which are no longer needed.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958A329E44
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512015; cv=none; b=Y6JZBATpllLJvIfydwhxmwALEWw+g0oUJD0ZShN13ytrb+ZHD2vLsHFeOkjJ2sOGTJkqH5pld7ZmCRo0REViQekDeuKHKw8Ncc6J6J7C2jSDPmctJSDS33nRGPpLVxHiK49zzgMBdWlZeefEFl7PQO75yzrJgSRNJ5P6pQFqVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512015; c=relaxed/simple;
	bh=/z/AIXjP5xC8tmgQZbu0/9zQ4AmOQmgco1dpipNtm+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DB43ItLM1kbH2xtqci5rQtXd4DSmnOSdSAoP4W4ppd3GxHUh8E6MRCLU4P2q5v6Fcb+IfYRpCMlyhVHsyREPXGeHnx2DQt743LjLM03DYC+6qY1W7j69N3zIpAfxri7jDnoiE0mK8tC+vTAKPtVjA59hxerNh34Si3+q9C4vp+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7P4Th0B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7P4Th0B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so368136f8f.2
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512012; x=1775116812; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7el6WA6ZNZjfmZVGd0QgdCpCIt3VJT2LRu865h7uJ60=;
        b=o7P4Th0B8nMTYYZfs3OlG7RVcIDQ1bCbgOI9LupX/2xDqYBbsq/xCSMGdDV1buqSqu
         aI7kIvOsfQHYbvWF4Wrhis32wkpppXg+hNCGsINll8tfXw96efZOlBGqGpaSgfxvXIGH
         34NnyAWYiqtyzJ/F/ddZbsQeDrbankNWDhqwli+bhDsAmlWQCCEPaMTJdbx8oB+7af7S
         E6iBwKtShYLLrJ39EdNlUEdcwWR6nDyqbJM5XGbmgrH2jQZNye9XkJWpboiatbeASj8s
         TAwvALnDfshPyK7VGXjNv7zfKe9bW5Lo4m3Zi4pRZxKSMLvncRJQO2yP/VrHu7AW4by8
         0c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512012; x=1775116812;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7el6WA6ZNZjfmZVGd0QgdCpCIt3VJT2LRu865h7uJ60=;
        b=arFfgOmS6dUcGVatuFU/aC/Q2dbEdvNeGvviK6ULKDvcGU/2W461nk4QXhOekYgno0
         E75GOxGiXQ7TBBSLlTC1+PoeH7/5WUcR7Sfcc4T+2XeiR10s7Od5fioGF5SGZzWKrNcD
         G7nYS8FkcRQ9Tu16uG7cTjZfyLvc8nMqEx/wyILmLU5tzTa7829/MTFx+CjdQPfH6gEi
         0pDaLM1MfUOl73gc67+CpQzpQldzMMSOBgdn3ZmkC7H8Cptw9BKyqKBN2a6vVPkGHrrG
         m8Oq9y9H9e38cNgo4jTOwkoPJ1p3dPWahcJKbz3cLXyEvnC551qeT9MIAMzKhUKlZ9zw
         LZug==
X-Forwarded-Encrypted: i=1; AJvYcCW6fWgMJt29Yj68E5vO6APh/F0ZlDmZ4bm0sbxPk+GeyP8ShDUJwf0YusaS/bMAIcBxGac=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1dGujoHP0ky7HuaGIj69WMeiI6bjBG0mR/5RfuGGuve7us8h4
	Vggr1rjbdOIwy9sUPvK6l45Uj7pwnalIX03nLlu8uAmMZrxbmPCeoI1V
X-Gm-Gg: ATEYQzxVwGaCfCEZUeHdQ2scP2JgAQsNaoZDa/GgyL5qgslx7ZxdxKjBJKR/X/giocc
	vx1GmVK7+jc9zwG4KTH8JAk+v4gG2pt5uwilGIqFv4CyNGwdfWzbvoSbJpduaL5zU0JagQnmEKK
	qrlTyK5YCxkztNzAxPyreu78nVzAtpa3MRkTQgzfzD/ROIsxO0e9mxtoemZQZbLjAwlcirvbYha
	1n2DGTY7LaNttdNLEBQTsDhY75TWLV5EcH9kTfgF/s+2+6y55YlLcu07O+R55Ml+eMwBComwi4Q
	K1Y525Y0gksu4x0ogZqzba1ACOefmdE7brQm6M7O9Ijoe+uX9JCXb6kjJByXyyu2hq4c/6zpYfL
	0VdxDqs5fXZvjLL/u5ZZn4mApZR973gbgGcR3BIbMg+0riT0I5sFbkd2qe4tZpyFhhRjx6BBTMK
	+cKWbv/31frd7N/zEr2uNVC8SXbcHEwyMZRrdQdoCFrDYTa0wRqRgaARsjkE10XMO2d5ZHe0btM
	uybe25RD/6X4TcddtER/+PM9fgCYHP4FINwl9lu9Sc3V/uswRkNMVBeJaiZvwSgpOShCQeJFQ==
X-Received: by 2002:a05:6000:240b:b0:43b:6127:2510 with SMTP id ffacd0b85a97d-43b88a0cb2fmr10393835f8f.42.1774512012165;
        Thu, 26 Mar 2026 01:00:12 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm6284811f8f.3.2026.03.26.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:00:11 -0700 (PDT)
Date: Thu, 26 Mar 2026 09:00:10 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Clear CLKREQ# override breaks functionality
Message-ID: <jfefktil6ywvugvbxdplbvry6g5efka5g4bpr2dwhha2mtrkm5@6gkcmj2glvwo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

While integrating the `supports-clkreq` DT property on our iMX95-based
SoM, we had failures in our CI on one of the two M.2 PCIe slots on our
development board. 
The failing slot uses a card that does not advertise L1 PM substates.
This issue comes from commit a152a90f5390 ("PCI: imx6: Clear CLKREQ# 
override if 'supports-clkreq' DT property is available"), which clears
the CLKREQ# override based only on the DT property.

It seems that clearing the CLKREQ# override should happen only
when the driver knows that the downstream device advertises L1 PM 
Substates. Otherwise CLKREQ# should remain asserted to keep compatibility
with cards that do not support L1 PM Substates.

Thoughts?

Kind Regards

Franz

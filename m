Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6DD214A64
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759462; cv=none; b=gxXxPGfLXT8U0sW8Z+1GmVSlCBpg7wci3YuMLfbzSUPQDmtWKrzDSQgRSl9d8+GWAjwmmm2GaJNLHfJfhawd67KL/prnOW8+Y75GsKWBYfX13f25+btI5UXDibu04TKLKg8MP4453/rSq0nFYCPjxPprDUq76Nm1/WNtrFUIK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759462; c=relaxed/simple;
	bh=kDWNIWdXhBCkRznJ1Up2G4DKQ4xbbwlecyd7rTZ4+1Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hEoy9mvyUTmISQofeAdSLEGhny8oolUmjdLKYVFhDkKOi+Myr99ZARu3kM0Mc4YI8FI3sX+hiGy6HwdZ109ywlaIoz2Z6iIqJ/Y4YsihUX9Pb8aQXD8Q6/5ldtV1bmrrPkHkWmoXnsx3vR6++eYsvcx2RiB7I/G/tucCoqYz/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBP+lEHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBP+lEHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF5EC4CEF7;
	Tue, 17 Mar 2026 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773759461;
	bh=kDWNIWdXhBCkRznJ1Up2G4DKQ4xbbwlecyd7rTZ4+1Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=CBP+lEHekQFOFUNjZauc6GvLutQQE2bLK77iztjOMYB2QtVQTY2j0vuSUiYKeYm5P
	 zPtsfowdwuFN+NkS9TjCDeCeLnOL1SDamOP7ebGusQE7hIObta65EF1DmnmQyaTPDg
	 dDy+WAFcNNKRgAvhkaPVe7O/OVEI6YTDnygVQDEpncZhKSz5uDXU7224t/VmCp5WqG
	 aaWrKJcGLz751PqleKk1BSj0It/sqfxaIEAEeyjvnDYzpXSm7FcBweu2GLGyObELqM
	 IK+QoNUVaHNt9vgI/1RcUCh9/EBbWbYptxemQn6GeEcONgQ19yZdmMooae44J/XCbv
	 FjsznGPadVzyQ==
Message-ID: <0274107a-90a3-4d15-b5ab-f5d420accb9a@kernel.org>
Date: Tue, 17 Mar 2026 15:57:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] i.MX fixes for 7.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
References: <20260312153557.3338430-1-Frank.Li@nxp.com>
 <20260317-jumping-corgi-of-defense-038bcd@quoll>
 <ablgRERiHQ1Tm2i6@lizhi-Precision-Tower-5810>
 <67fc1526-c32a-4e74-ac37-8f8c2c0df46a@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <67fc1526-c32a-4e74-ac37-8f8c2c0df46a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2026 15:44, Krzysztof Kozlowski wrote:
> On 17/03/2026 15:08, Frank Li wrote:
>> On Tue, Mar 17, 2026 at 09:03:19AM +0100, Krzysztof Kozlowski wrote:
>>> On Thu, Mar 12, 2026 at 11:35:54AM -0400, Frank Li wrote:
>>>> From: Frank Li <Frank.li@nxp.com>
>>>>
>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>
>>>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
>>>>
>>>> for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:
>>>>
>>>>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)
>>>
>>> Hooks fail.
>>>
>>> Commit 587096ada520 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
>>> 	committer Signed-off-by missing
>>>
>>
>> Sorry, I will update it.
>>
>>> Please implement basic checks from beginnners maintainer guide (LPC
>>> 2023).
>>
>> Suppose this one?
>> https://lpc.events/event/17/contributions/1498/attachments/1155/2452/Maintainer's%20toolbox%20-%20Linux%20Plumbers%202023%20-%20Krzysztof%20Kozlowski.pdf
>>
> 
> Yes, although I am moving hooks to soc-tools repo
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git

And second problem is that why you did not fix it after report from Mark
on next? Patches you sent for current cycle must stay for at least one
day in the next, prior sending, so you receive at least some feedback.
Only then you send the pull request.

Best regards,
Krzysztof
